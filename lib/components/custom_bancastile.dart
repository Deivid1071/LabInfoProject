import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class CustomListTile extends StatelessWidget {
  final String title;
  final String orientador;
  final String dataMarcada;
  final String hora;

  CustomListTile({this.title, this.orientador, this.dataMarcada, this.hora});
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
          height: MediaQuery.of(context).size.height * 0.2,
          width: MediaQuery.of(context).size.width * 0.8,
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    title??'titulo',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Container(
                    child: Row(
                      children: [
                        Text(
                          hora??'hora',
                          style:
                          TextStyle(color: Color(0xFF4EB2EA), fontSize: 18),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Text(
                          dataMarcada??'data',
                          style:
                              TextStyle(color: Color(0xFF4EB2EA), fontSize: 18),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Icon(
                          Icons.watch_later,
                          color: Color(0xFF4EB2EA),
                        )
                      ],
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    orientador??'Orientador',
                    style: TextStyle(color: Color(0xFF4EB2EA), fontSize: 18),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                          color: Color(0xFF4EB2EA),
                          borderRadius: BorderRadius.circular(8)),
                      child: Row(
                        children: [
                          Text(
                            'Emitir\ncertificado',
                            style: TextStyle(
                                color: Colors.white, fontWeight: FontWeight.bold),
                          ),
                          Icon(
                            Icons.file_download,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
