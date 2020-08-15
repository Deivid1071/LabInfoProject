import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import 'modal_agendamento.dart';

class CustomListTileOrientado extends StatefulWidget {
  @override
  _CustomListTileOrientadoState createState() => _CustomListTileOrientadoState();
}

class _CustomListTileOrientadoState extends State<CustomListTileOrientado> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 16),
      child: Material(
        elevation: 10,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        clipBehavior: Clip.antiAlias,
        child: Container(
          height: 120,
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                'Nome do Projeto',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                child: IconButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return ModalAgendamento();
                      },
                    );
                  },
                  icon: Icon(
                    Icons.add_circle_outline,
                    size: 50,
                    color: Color(
                      0xFF4EB2EA,
                    ),
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
