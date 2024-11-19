import 'package:flutter/material.dart';
import 'dart:math';

class RotatedMultiplication extends StatefulWidget {
  const RotatedMultiplication({super.key});

  @override
  State<RotatedMultiplication> createState() => _RotatedMultiplicationState();
}

class _RotatedMultiplicationState extends State<RotatedMultiplication> {
  int index = 0; // 아이콘이 가리킬 숫자 (0~9)
  int first = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 250, // 원의 높이
              width: 250, // 원의 너비
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // 원형 배치된 숫자들
                  ...List.generate(10, (i) {
                    double angle =
                        (i * (2 * pi)) / 10 - pi / 2; // 12시 기준으로 시작
                    double radius = 100; // 원의 반지름
                    return Transform.translate(
                      offset: Offset(
                        radius * cos(angle), // X 좌표
                        radius * sin(angle), // Y 좌표
                      ),
                      child: Container(
                        width: 40,
                        height: 40,
                        alignment: Alignment.center,
                        color: Colors.orange,
                        child: Text(
                          '$i',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    );
                  }),
                  // 중앙 아이콘 추가 (현재 index 값에 맞춰 회전)
                  Transform.rotate(
                    angle: (index * (2 * pi)) / 10 - pi / 2, // 숫자에 맞는 각도
                    child: Icon(
                      Icons.arrow_right_alt_outlined, // 원하는 아이콘
                      color: Colors.black,
                      size: 60,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 60,),
            Center(
              child: Text("$first", style: TextStyle(fontSize: 48, color: Colors.black),),
            ),
            SizedBox(height: 60,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      index = (index + 1) % 10;// 0~9 사이 값으로 순환
                    });
                  },
                  child: Text("회전"),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      first*=index;
                    });
                  },
                  child: Text("곱하기"),
                ),
                OutlinedButton(
                  onPressed: () {
                    setState(() {
                      first = 1;
                    });
                  },
                  child: Text("초기화"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
