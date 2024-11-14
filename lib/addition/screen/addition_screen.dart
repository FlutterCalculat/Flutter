// lib/screen/home_screen.dart
import 'package:adder/view/custom_app_bar.dart';
import 'package:flutter/material.dart';


class AdditionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(name: "이승혁", type: "덧셈"),
      body: Center(
        child: Text(
          'Welcome to the Home Screen!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
