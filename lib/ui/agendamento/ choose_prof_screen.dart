import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChooseProfScreen extends StatefulWidget {
  @override
  _ChooseProfScreenState createState() => _ChooseProfScreenState();
}

class _ChooseProfScreenState extends State<ChooseProfScreen> {
  List<bool> _selected;
  List<String> professores;
  List<String> selecionados;

  @override
  void initState() {
    _selected = [];
    selecionados = [];
    professores = [
      'Jose',
      'João',
      'Maria',
      'Gertrudes',
      'Adoleta',
      'Zefa',
    ];
    professores.forEach((element) {
      _selected.add(false);
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(professores.length);
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
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
        body: ListView.builder(
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(professores[index]),
              value: _selected[index],
              onChanged: (bool value) {
                setState(() {
                  _selected[index] = value;
                });
                if(_selected[index]) {
                  selecionados.add(professores[index]);
                }else{
                  selecionados.remove(professores[index]);
                }

                print(selecionados);
              },
            );
          },
          itemCount: professores.length,
        ),
      ),
    );
  }
}
