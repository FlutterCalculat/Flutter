

import 'package:adder/view/custom_app_bar.dart';
import 'package:flutter/material.dart';
import '../feature/gesture_multiplication.dart';
import '../feature/rotated_multiplication.dart';

class MultiplicationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(name: "한준혁", type: "곱셈"),
      body: RotatedMultiplication(),
    );
  }
}