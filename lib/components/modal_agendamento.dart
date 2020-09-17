import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:intl/intl.dart';
import 'package:labinfoapp/model/banca.dart';
import 'package:labinfoapp/service/services_api.dart';
import 'package:labinfoapp/ui/agendamento/%20choose_prof_screen.dart';

import 'custom_text_field.dart';

class ModalAgendamento extends StatefulWidget {
  final Banca banca;

  const ModalAgendamento({Key key, this.banca}) : super(key: key);
  @override
  _ModalAgendamentoState createState() => _ModalAgendamentoState();
}

class _ModalAgendamentoState extends State<ModalAgendamento> {
  TextEditingController _nomeProjetoController;
  TextEditingController _horaController;
  TextEditingController _minController;
  DateTime _dateTime;
  String stringData;
  bool isLoading;
  bool showPass;
  String curso;
  String integrante;

  @override
  void initState() {
    _nomeProjetoController = TextEditingController(text: widget.banca?.titulo??"");
    _horaController = TextEditingController();
    _minController = TextEditingController();
    isLoading = false;
    showPass = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Material(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: SingleChildScrollView(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Agendar \nApresentação',
                      style: TextStyle(
                          fontSize: 23,
                          color: Color(0xFF045A8A),
                          fontWeight: FontWeight.bold),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(Icons.close),
                      color: Colors.red,
                    )
                  ],
                ),
                SizedBox(
                  height: 18,
                ),
                CustomTextField(
                  hint: 'Nome do projeto',
                  textInputType: TextInputType.text,
                  controller: _nomeProjetoController,
                  enabled: !isLoading,
                ),
                SizedBox(
                  height: 18,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Horário',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        Container(
                          color:Colors.grey[200],
                          child: Row(
                            children: [
                              Container(
                                width: 50,
                                child: CustomTextField(
                                  controller: _horaController,
                                  hint: '00',
                                  textInputType: TextInputType.number,
                                  maxLenght: 2,
                                ),
                              ),
                              Text(':'),
                              Container(
                                width: 50,
                                child: CustomTextField(
                                  controller: _minController,
                                  hint: '00',
                                  textInputType: TextInputType.number,
                                  maxLenght: 2,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 18,
                ),
                Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    height: 50,
                    width: MediaQuery.of(context).size.width * 0.75,
                    decoration: BoxDecoration(
                      shape: BoxShape.rectangle,
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          stringData?? widget.banca?.dataMarcada ?? 'Data',
                          style: TextStyle(fontSize: 20, color: Colors.grey),
                        ),
                        IconButton(
                          onPressed: () {
                            showDatePicker(
                                context: context,
                                initialDate: _dateTime == null
                                    ? DateTime.now()
                                    : _dateTime,
                                firstDate: DateTime.now(),
                                lastDate: DateTime(2021))
                                .then((date) {
                              String dateformat =
                              new DateFormat("dd-MM-yyyy").format(date);
                              setState(() {
                                stringData = dateformat;
                                _dateTime = date;
                              });
                            });
                            print('teste');
                          },
                          icon: Icon(
                            Icons.calendar_today,
                            size: 32,
                            color: Color(0xFF4EB2EA),
                          ),
                        ),
                      ],
                    )),
                SizedBox(
                  height: 13,
                ),
                Container(

                  padding: EdgeInsets.symmetric(horizontal: 16),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(16)),
                  width: MediaQuery.of(context).size.width * 0.78,
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      value: curso != null ? curso : null,
                      hint: Text(
                        'Cursos                  ',
                        style: TextStyle(color: Colors.grey, fontSize: 20),
                      ),
                      items: <String>['Opção 1', 'Opção 2', 'Opção 3', 'Opção 4']
                          .map((String value) {
                        return new DropdownMenuItem<String>(
                          value: value,
                          child: new Text(value),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          curso = value;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 13,
                ),
                GestureDetector(
                  onTap: (){
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ChooseProfScreen()));
                  },
                  child: Container(
                    height: 50,
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        borderRadius: BorderRadius.circular(16)),
                    width: MediaQuery.of(context).size.width * 0.78,
                    child: Text(
                      'Membros da banca',
                      style: TextStyle(color: Colors.grey, fontSize: 20),
                    ),
                  ),
                ),
                Container(

                  padding: EdgeInsets.only(top: 20),
                  child: ButtonTheme(
                    height: 45,
                    minWidth: 100,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      color: Color(0xFF80E66F),
                      child: isLoading
                          ? CircularProgressIndicator(
                              valueColor: AlwaysStoppedAnimation(Colors.white),
                            )
                          : Text(
                              'Confirmar',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontSize: 17),
                            ),
                      onPressed: () {
                        setState(() {
                          isLoading = !isLoading;
                        });
                        Navigator.pop(context);
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
