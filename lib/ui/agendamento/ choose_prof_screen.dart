import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labinfoapp/service/services_api.dart';

class ChooseProfScreen extends StatefulWidget {
  @override
  _ChooseProfScreenState createState() => _ChooseProfScreenState();
}

class _ChooseProfScreenState extends State<ChooseProfScreen> {
  List<bool> _selected;
  List<Professor> professores;
  List<int> selecionados;
  ApiService api;
  String erro;
  bool isLoading;

  @override
  void initState() {
    api = ApiService();
    _selected = [];
    selecionados = [];
    professores = [];
    _getData();
    super.initState();
  }

  _getData() async {
    List<Professor> response = await api.getProfessores();
    if (response is String) {
      setState(() {
        //erro = response;
        isLoading = false;
      });
    } else {
      setState(() {
        response.forEach((element) {
          professores.add(element);
        });
        professores.forEach((element) {
          _selected.add(false);
        });
        isLoading = false;
      });
    }

    print(response);
  }

  @override
  Widget build(BuildContext context) {
    print(professores.length);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context, selecionados),
            icon: Icon(Icons.arrow_back, color: Color(0xFF045A8A)),
          ),
          title: Text(
            'Selecione os integrantes',
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              color: Color(0xFF045A8A),
            ),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return CheckboxListTile(
                    title: Text(professores[index].nome),
                    value: _selected[index],
                    onChanged: (bool value) {
                      setState(() {
                        _selected[index] = value;
                      });
                      if (_selected[index]) {
                        selecionados.add(professores[index].id);
                      } else {
                        selecionados.remove(professores[index].id);
                      }

                      print(selecionados);
                    },
                  );
                },
                itemCount: professores.length,
              ),
              Container(
                padding: EdgeInsets.only(top: 60, bottom: 15),
                child: ButtonTheme(
                  height: 45,
                  minWidth: 100,
                  child: RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    color: Color(0xFF80E66F),
                    child: Text(
                      'Selecionar',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 17),
                    ),
                    onPressed: () async {
                      Navigator.pop(context, selecionados);
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
