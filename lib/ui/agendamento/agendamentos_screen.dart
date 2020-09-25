import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:labinfoapp/components/custom_bancastile.dart';
import 'package:labinfoapp/components/custom_text_field.dart';
import 'package:labinfoapp/service/services_api.dart';
import 'package:labinfoapp/ui/register/register_screen.dart';

class AgendamentosScreen extends StatefulWidget {
  @override
  _AgendamentosScreenState createState() => _AgendamentosScreenState();
}

class _AgendamentosScreenState extends State<AgendamentosScreen> {
  ApiService api;
  String erro;
  bool isLoading;
  List<MinhaBanca> minhasBancas = [];

  @override
  void initState() {
    isLoading = true;
    api = ApiService();
    _getData();
    super.initState();
  }

  _getData() async {
    var response = await api.getMinhasBancas(1);
    if (response is String) {
      setState(() {
        erro = response;
        isLoading = false;
      });
    } else {
      setState(() {
        minhasBancas = response;
        isLoading = false;
      });
    }

    print(response);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF4EB2EA),
        body: !isLoading
            ? SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
            SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text(
                'Minhas Bancas',
                style: TextStyle(
                    fontSize: 35,
                    color: Color(0xFF045A8A),
                    fontWeight: FontWeight.bold),
              ),
              Icon(
                Icons.date_range,
                size: 30,
                color: Color(0xFF045A8A),
              )
            ],
          ),
          Container(
            padding: EdgeInsets.only(top: 16, left: 18, right: 18),
            child: minhasBancas.isNotEmpty ? ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return CustomListTile(
                  title: minhasBancas[index].titulo,
                  orientador: minhasBancas[index].orientador,
                  dataMarcada: minhasBancas[index].data,
                  hora: minhasBancas[index].hora,
                );
              },
              itemCount: 15,
              shrinkWrap: true,
            ) : Padding(
              padding: const EdgeInsets.only(top: 250),
              child: Text('Atualmente sem bancas', style: TextStyle(
                fontSize: 20,
                color: Color(0xFF045A8A),
              ),),
            ),),
        ],
      ),
    ): Center(
    child: CircularProgressIndicator(
    valueColor: AlwaysStoppedAnimation(Colors.white),
    ),
    ),
    ),
    );
  }
}
