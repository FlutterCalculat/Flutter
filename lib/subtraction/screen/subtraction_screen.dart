import 'package:adder/view/custom_app_bar.dart';
import 'package:flutter/material.dart';

import '../feature/substract_animator.dart';

class SubtractionScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        name: "임금",
        type: "뺄셈",
      ),
      body: SubtractAnimator(),
    );
  }
}