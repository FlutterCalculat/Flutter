

import 'package:adder/main.dart';
import 'package:flutter/material.dart';
import 'package:adder/addition/screen/addition_screen.dart';
import 'package:adder/divistion/screen/division_screen.dart';
import 'package:adder/multiplication/screen/multiplication_screen.dart';
import 'package:adder/subtraction/screen/subtraction_screen.dart';


class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() =>
      _MainScreenState();
}

class _MainScreenState
    extends State<MainScreen> {
  int _selectedIndex = 0;
  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    getIt<AdditionScreen>(),
    getIt<SubtractionScreen>(),
    getIt<MultiplicationScreen>(),
    getIt<DivisionScreen>(),
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
