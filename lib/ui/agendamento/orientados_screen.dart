import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:labinfoapp/components/custom_bancastile.dart';
import 'package:labinfoapp/components/custom_orientandostile.dart';
import 'package:labinfoapp/components/custom_text_field.dart';
import 'package:labinfoapp/model/banca.dart';
import 'package:labinfoapp/service/services_api.dart';
import 'package:labinfoapp/ui/register/register_screen.dart';

class OrientandosScreen extends StatefulWidget {
  @override
  _OrientandosScreenState createState() => _OrientandosScreenState();
}

class _OrientandosScreenState extends State<OrientandosScreen> {
  ApiService api;
  List<Banca> orientandos = [];
  String erro;
  bool isLoading;

  @override
  void initState() {
    isLoading = true;
    api = ApiService();
    _getData();
    super.initState();
  }

  _getData() async {
    var response  = await api.getProjetos();
    if(response is String){
      setState(() {
        erro = response;
        isLoading = false;
      });
    }else{
      setState(() {
        orientandos = response;
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
        body: !isLoading ? SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Column(
            children: [
              SizedBox(height: 8,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    'Orientandos',
                    style: TextStyle(
                        fontSize: 35,
                        color: Color(0xFF045A8A),
                        fontWeight: FontWeight.bold),
                  ),
                  Icon(
                    Icons.group,
                    size: 30,
                    color: Color(0xFF045A8A),
                  )
                ],
              ),
              orientandos.isNotEmpty ? Container(
                padding: EdgeInsets.only(top: 16, left: 18, right: 18),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomListTileOrientado(banca: orientandos[index],);
                  },
                  itemCount: orientandos.length,
                  shrinkWrap: true,
                ),
              ):Container(),
            ],
          ),
        ): Center(
          child: CircularProgressIndicator(
            valueColor:
            AlwaysStoppedAnimation(Colors.white),
          ),
        ),
      ),
    );
  }
}
