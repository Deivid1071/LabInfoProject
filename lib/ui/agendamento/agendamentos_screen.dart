import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:labinfoapp/components/custom_bancastile.dart';
import 'package:labinfoapp/components/custom_text_field.dart';
import 'package:labinfoapp/ui/register/register_screen.dart';

class AgendamentosScreen extends StatefulWidget {
  @override
  _AgendamentosScreenState createState() => _AgendamentosScreenState();
}

class _AgendamentosScreenState extends State<AgendamentosScreen> {
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
                child: ListView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return CustomListTile();
                  },
                  itemCount: 15,
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
