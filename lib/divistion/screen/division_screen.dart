import 'package:adder/view/custom_app_bar.dart';
import 'package:flutter/material.dart';

List<int> arr = []; // 전역 리스트
String check = "";
String show = "";
double result = 0.0;

class DivisionScreen extends StatefulWidget {
  @override
  _DivisionScreenState createState() => _DivisionScreenState();
}

class _DivisionScreenState extends State<DivisionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(name: "노영재", type: "나눗셈"),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // arr 값을 텍스트로 표시
            Row(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: test('$result'),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        NumberButton(number: 7, onPressed: makeNumber),
                        NumberButton(number: 8, onPressed: makeNumber),
                        NumberButton(number: 9, onPressed: makeNumber),
                      ],
                    ),
                    Row(
                      children: [
                        NumberButton(number: 4, onPressed: makeNumber),
                        NumberButton(number: 5, onPressed: makeNumber),
                        NumberButton(number: 6, onPressed: makeNumber),
                      ],
                    ),
                    Row(
                      children: [
                        NumberButton(number: 1, onPressed: makeNumber),
                        NumberButton(number: 2, onPressed: makeNumber),
                        NumberButton(number: 3, onPressed: makeNumber),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        if (check.isNotEmpty) {
                          setState(() {
                            arr.add(int.parse(check));
                            check = "";
                            show += "/";
                          });
                        }
                      },
                      child: Text("/"),
                    ),
                    TextButton(
                      onPressed: calculate,
                      child: Text("="),
                    ),
                    TextButton(
                      onPressed: () {
                        if (result > 0) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                content: Text("결과: ${result / 2}"),
                              );
                            },
                          );
                        }
                      },
                      child: Text(
                        "반으로\n나누기",
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void makeNumber(int number) {
    setState(() {
      check += number.toString();
      show += number.toString();
    });
  }

  void calculate() {
    if (check.isNotEmpty) {
      arr.add(int.parse(check));
    }

    if (arr.isNotEmpty) {
      double a = arr[0].toDouble();
      for (int i = 1; i < arr.length; i++) {
        if (arr[i] == 0) {
          // 0으로 나눌 경우 예외 처리
          showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                content: Text("0으로 나눌 수 없습니다."),
              );
            },
          );
          return;
        }
        a = a / arr[i];
      }
      setState(() {
        result = a;
        show = "";
        check = "";
        arr.clear();
      });
    }
  }

  List<Widget> test(String number) {
    List<Widget> result = [];
    double width = 100;
    double height = 100;

    for (int i = 0; i < number.length; i++) {
      if (number[i] == '.') {
        result.add(Image.asset('assets/image/dot.jpg', width: 50, height: 50));
      } else if ('0123456789'.contains(number[i])) {
        result.add(Image.asset(
          'assets/image/${number[i]}.jpg',
          width: width,
          height: height,
        ));
      }
    }

    return result;
  }
}

class NumberButton extends StatelessWidget {
  final int number;
  final void Function(int) onPressed;

  const NumberButton({
    required this.number,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        onPressed(number);
      },
      child: Text(number.toString()),
    );
  }
}