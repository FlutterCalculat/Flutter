import 'package:adder/view/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:adder/addition/component/addition_button.dart';
import 'dart:math';

class AdditionScreen extends StatefulWidget {
  @override
  _AdditionScreenState createState() => _AdditionScreenState();
}

class _AdditionScreenState extends State<AdditionScreen> {
  String input = ''; // 화면에 표시될 식
  String result = '0'; // 최종 결과

  void handleButtonPress(String value) {
    setState(() {
      if (value == '=') {
        // 수식 평가
        result = _evaluateExpression(input);
      } else {
        // 수식 업데이트
        input += value;
      }
    });
  }

  void resetCalculator() {
    setState(() {
      input = '';
      result = '0';
    });
  }

  String _evaluateExpression(String expression) {
    try {
      // 공백 제거
      expression = expression.replaceAll(' ', '');
      // '+'로 나누어 숫자만 합산
      List<String> numbers = expression.split('+');
      double total = 0;
      for (var number in numbers) {
        total += double.tryParse(number) ?? 0;
      }
      // 결과를 정수로 표시할지 실수로 표시할지 결정
      return total % 1 == 0 ? total.toInt().toString() : total.toString();
    } catch (e) {
      return '오류'; // 수식이 잘못된 경우
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: CustomAppBar(name: "이승혁", type: "덧셉", background: Colors.black),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          // 결과 및 입력 표시 영역
          Expanded(
            flex: 2,
            child: Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.fromLTRB(20, 0, 20, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    input.isEmpty ? '0' : input,
                    style: TextStyle(fontSize: 48, color: Colors.white),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(height: 10),
                  Text(
                    result,
                    style: TextStyle(fontSize: 36, color: Colors.grey),
                    textAlign: TextAlign.right,
                  ),
                ],
              ),
            ),
          ),

          // 버튼 영역
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdditionButton(text: '7', onPressed: handleButtonPress),
                  AdditionButton(text: '8', onPressed: handleButtonPress),
                  AdditionButton(text: '9', onPressed: handleButtonPress),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdditionButton(text: '4', onPressed: handleButtonPress),
                  AdditionButton(text: '5', onPressed: handleButtonPress),
                  AdditionButton(text: '6', onPressed: handleButtonPress),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdditionButton(text: '1', onPressed: handleButtonPress),
                  AdditionButton(text: '2', onPressed: handleButtonPress),
                  AdditionButton(text: '3', onPressed: handleButtonPress),
                ],
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  AdditionButton(text: '0', onPressed: handleButtonPress),
                  AdditionButton(
                    text: '+',
                    color: Colors.orange,
                    textColor: Colors.white,
                    onPressed: handleButtonPress,
                  ),
                  AdditionButton(
                    text: '=',
                    color: Colors.green,
                    textColor: Colors.white,
                    onPressed: handleButtonPress,
                  ),
                ],
              ),
              SizedBox(height: 20),
              // 초기화 버튼
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(
                        onPressed: resetCalculator,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xFF333333),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Text(
                          '초기화',
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
