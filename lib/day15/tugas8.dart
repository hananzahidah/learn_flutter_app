import 'package:flutter/material.dart';
import 'package:flutter_application_1/day15/infoScreen.dart';
import 'package:flutter_application_1/day15/tugas7.dart';
import 'package:flutter_application_1/day_16/tugas9.dart';

class Tugas8 extends StatefulWidget {
  const Tugas8({super.key});

  @override
  State<Tugas8> createState() => _Tugas8State();
}

class _Tugas8State extends State<Tugas8> {
  int _selectedIndex = 0;

  static const List<Widget> _widgetOptions = <Widget>[
    Tugas7(),
    Tugas9(),
    Infoscreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: _widgetOptions.elementAt(_selectedIndex)),

      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.info), label: "Info"),
        ],
        backgroundColor: Colors.white,
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF005BBF),
        onTap: _onItemTapped,
      ),
    );
  }
}
