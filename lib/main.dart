import 'package:adder/addition/screen/addition_screen.dart';
import 'package:adder/etc_screen/splash_screen.dart';
import 'package:adder/multiplication/feature/gesture_multiplication.dart';
import 'package:adder/multiplication/feature/rotated_multiplication.dart';
import 'package:adder/multiplication/screen/multiplication_screen.dart';
import 'package:adder/subtraction/feature/substract_animator.dart';
import 'package:adder/subtraction/screen/subtraction_screen.dart';
import 'package:adder/view/bottom_nav_view.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'divistion/screen/division_screen.dart';
import 'multiplication/feature/multiplication_tab.dart';

final getIt = GetIt.instance;

void setUp(){
  getIt.registerSingleton<MultiplicationScreen>(MultiplicationScreen());
  getIt.registerSingleton<GestureMultiplication>(GestureMultiplication());
  getIt.registerSingleton<RotatedMultiplication>(RotatedMultiplication());
  getIt.registerSingleton<MultiplicationTab>(MultiplicationTab());
  getIt.registerSingleton<SplashScreen>(SplashScreen());
  getIt.registerSingleton<MainScreen>(MainScreen());
  getIt.registerSingleton<AdditionScreen>(AdditionScreen());
  getIt.registerSingleton<SubtractionScreen>(SubtractionScreen());
  getIt.registerSingleton<DivisionScreen>(DivisionScreen());
  getIt.registerSingleton<SubtractAnimator>(SubtractAnimator());
  getIt.registerSingleton<MyApp>(MyApp());
}

void main() {
  setUp();
  runApp(getIt<MyApp>());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: getIt<SplashScreen>(),
      debugShowCheckedModeBanner: false,
    );
  }
}
