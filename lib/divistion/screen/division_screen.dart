import 'package:adder/view/custom_app_bar.dart';
import 'package:flutter/material.dart';

// import 'package:adder/view/custom_app_bar.dart';
// import 'package:flutter/material.dart';

List<int> arr = [0, 0]; // 전역 리스트

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
          children: [
            // arr 값을 텍스트로 표시
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: test('${arr[0] / arr[1]}'),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${arr[0]}/',
                  style: TextStyle(fontSize: 20),
                ),
                Text(
                  '${arr[1]}=',
                  style: TextStyle(fontSize: 20),
                ),
                Text('${arr[0] / arr[1]}')
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
                        NumberButton(number: 7, onPressed: updateState),
                        NumberButton(number: 8, onPressed: updateState),
                        NumberButton(number: 9, onPressed: updateState),
                      ],
                    ),
                    Row(
                      children: [
                        NumberButton(number: 4, onPressed: updateState),
                        NumberButton(number: 5, onPressed: updateState),
                        NumberButton(number: 6, onPressed: updateState),
                      ],
                    ),
                    Row(
                      children: [
                        NumberButton(number: 1, onPressed: updateState),
                        NumberButton(number: 2, onPressed: updateState),
                        NumberButton(number: 3, onPressed: updateState),
                      ],
                    ),
                  ],
                ),
                SizedBox(width: 16),
                Column(
                  children: [
                    TextButton(
                      onPressed: () {
                        if (arr[0] / arr[1] > 0) {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                  content: Text("결과: ${arr[0] / arr[1] / 2}"));
                            },
                          );
                        }
                      },
                      child: Text("반으로 나누기"),
                    )
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  // 상태 업데이트 함수
  void updateState(int number) {
    setState(() {
      if (arr[0] == 0) {
        arr[0] = number;
      } else if (arr[1] == 0) {
        arr[1] = number;
      } else {
        arr = [number, 0]; // 초기화 후 첫 번째 값 설정
      }
    });
  }

  List<Widget> test(String number) {
    List<Widget> result = [];

    double width = 100;
    double height = 100;

    for (int i = 0; i < number.length; i++) {
      if (number[i] == '0') {
        result.add(Image.asset('assets/image/${number[i]}.jpg', width: width, height: height,));
      }
      if (number[i] == '1') {
        result.add(Image.asset('assets/image/${number[i]}.jpg', width: width, height: height,));      }
      if (number[i] == '2') {
        result.add(Image.asset('assets/image/${number[i]}.jpg', width: width, height: height,));
      }
      if (number[i] == '3') {
        result.add(Image.asset('assets/image/${number[i]}.jpg', width: width, height: height,));
      }
      if (number[i] == '4') {
        result.add(Image.asset('assets/image/${number[i]}.jpg', width: width, height: height,));
      }
      if (number[i] == '5') {
        result.add(Image.asset('assets/image/${number[i]}.jpg', width: width, height: height,));
      }
      if (number[i] == '6') {
        result.add(Image.asset('assets/image/${number[i]}.jpg', width: width, height: height,));
      }
      if (number[i] == '7') {
        result.add(Image.asset('assets/image/${number[i]}.jpg', width: width, height: height,));
      }
      if (number[i] == '8') {
        result.add(Image.asset('assets/image/${number[i]}.jpg', width: width, height: height,));
      }
      if (number[i] == '9') {
        result.add(Image.asset('assets/image/${number[i]}.jpg', width: width, height: height,));
      }
      if (number[i] == '.') {
        result.add(Image.asset('assets/image/dart.jpg', width: 50, height: 50,));
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
