import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:labinfoapp/components/custom_bancastile.dart';
import 'package:labinfoapp/components/custom_orientandostile.dart';
import 'package:labinfoapp/components/custom_text_field.dart';
import 'package:labinfoapp/ui/register/register_screen.dart';

class OrientandosScreen extends StatefulWidget {
  @override
  _OrientandosScreenState createState() => _OrientandosScreenState();
}

class _OrientandosScreenState extends State<OrientandosScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF4EB2EA),
        body: SingleChildScrollView(
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
              Container(
                padding: EdgeInsets.only(top: 16, left: 18, right: 18),
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomListTileOrientado();
                  },
                  itemCount: 8,
                  shrinkWrap: true,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
