

import 'package:flutter/material.dart';
import 'package:adder/screen/addition_screen.dart';
import 'package:adder/screen/division_screen.dart';
import 'package:adder/screen/multiplication_screen.dart';
import 'package:adder/screen/subtraction_screen.dart';


class BottomNavigationBarExample extends StatefulWidget {
  const BottomNavigationBarExample({super.key});

  @override
  State<BottomNavigationBarExample> createState() =>
      _BottomNavigationBarExampleState();
}

class _BottomNavigationBarExampleState
    extends State<BottomNavigationBarExample> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    AdditionScreen(),
    SubtractionScreen(),
    MultiplicationScreen(),
    DivisionScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.shifting,
        // 타입 설정 추가
        backgroundColor: Colors.black,
        iconSize: 30,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: Icon(Icons.add),
              label: '덧셈',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.remove_rounded),
              label: '뺄셈',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.clear_rounded),
              label: '곱셈',
              backgroundColor: Colors.black),
          BottomNavigationBarItem(
              icon: Icon(Icons.shape_line_outlined),
              label: '나눗셈',
              backgroundColor: Colors.black)
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        unselectedItemColor: Colors.white,
        onTap: _onItemTapped,
      ),
    );
  }
}
