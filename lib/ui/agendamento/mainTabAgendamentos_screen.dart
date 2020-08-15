import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:labinfoapp/ui/login/login_screen.dart';

import 'agendamentos_screen.dart';
import 'orientados_screen.dart';

class MainTabAgendamentos extends StatefulWidget {
  @override
  _MainTabAgendamentosState createState() => _MainTabAgendamentosState();
}

class _MainTabAgendamentosState extends State<MainTabAgendamentos> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    AgendamentosScreen(),
    OrientandosScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            title: Text('Minhas Bancas'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.people),
            title: Text('Orientados'),
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.exit_to_app),
              title: Text('Sair')
          )
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    if(index == 2 ){
      Navigator.push(context, MaterialPageRoute(builder: (context)=>LoginScreen()));
    }else{
      setState(() {
        _currentIndex = index;
      });
    }
  }
}
