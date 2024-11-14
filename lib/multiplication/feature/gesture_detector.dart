import 'package:flutter/material.dart';

class GestureDetectorExample extends StatefulWidget {
  const GestureDetectorExample({super.key});

  @override
  State<GestureDetectorExample> createState() => _GestureDetectorExampleState();
}

class _GestureDetectorExampleState extends State<GestureDetectorExample> {
  int _first_counter = 0;  // 첫 번째 카운터
  int _second_counter = 0; // 두 번째 카운터
  bool isFirstDoubleTap = false; // 첫 번째 더블탭 여부 추적
  bool isMultiplied = false; // 두 숫자를 곱했는지 추적
  double _dragStartX = 0.0; // 드래그 시작 지점 X 좌표
  bool isIncreasingFirstCounter = false; // 첫 번째 카운터가 증가 중인지 추적
  bool isIncreasingSecondCounter = false; // 두 번째 카운터가 증가 중인지 추적

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (isMultiplied) {
          // 두 숫자를 곱한 후 탭을 하면 모든 값을 초기화
          setState(() {
            _first_counter = 0;
            _second_counter = 0;
            isFirstDoubleTap = false;
            isMultiplied = false;
            isIncreasingFirstCounter = false;
            isIncreasingSecondCounter = false;
          });
        } else if (isFirstDoubleTap && !isMultiplied) {
          // 첫 번째 더블탭 후 두 번째 카운터 증가
          setState(() {
            _second_counter += 1; // 두 번째 카운터 증가
            isIncreasingSecondCounter = true; // 두 번째 카운터가 증가 중임을 표시
            isIncreasingFirstCounter = false; // 첫 번째 카운터는 증가 중 아님
          });
        } else if (isMultiplied) {
          // 두 숫자를 곱했을 때 더블탭 후에는 첫 번째 카운터 증가
          setState(() {
            _first_counter += 1; // 첫 번째 카운터 증가
            isIncreasingFirstCounter = true; // 첫 번째 카운터가 증가 중임을 표시
            isIncreasingSecondCounter = false; // 두 번째 카운터는 증가 중 아님
          });
        } else {
          // 더블탭 전에는 첫 번째 카운터만 증가
          setState(() {
            _first_counter += 1;
            isIncreasingFirstCounter = true; // 첫 번째 카운터가 증가 중임을 표시
            isIncreasingSecondCounter = false; // 두 번째 카운터는 증가 중 아님
          });
        }
      },
      onDoubleTap: () {
        if (!isFirstDoubleTap) {
          // 첫 번째 더블탭 시 두 번째 카운터 올리기
          setState(() {
            isFirstDoubleTap = true;
          });
        } else if (!isMultiplied) {
          // 두 번째 더블탭 시 두 숫자 곱하기
          setState(() {
            isMultiplied = true; // 두 값을 곱함
          });
        }
      },
      onHorizontalDragStart: (details) {
        // 드래그 시작 지점 X 좌표를 기록
        _dragStartX = details.localPosition.dx;
      },
      onHorizontalDragUpdate: (details) {
        // 드래그 방향에 따라 음수 적용
        setState(() {
          if (details.localPosition.dx < _dragStartX) {
            // 왼쪽으로 드래그 시, 현재 증가 중인 카운터에 음수 적용
            if (isIncreasingFirstCounter) {
              // 첫 번째 카운터가 증가 중일 때 음수 적용
              _first_counter = _first_counter * -1;
            } else if (isIncreasingSecondCounter) {
              // 두 번째 카운터가 증가 중일 때 음수 적용
              _second_counter = _second_counter * -1;
            }
          }
        });
      },
      child: Container(
        color: Colors.white,
        height: double.infinity,
        width: double.infinity,
        child: Center(
          child: Text(
            isMultiplied
                ? '${_first_counter * _second_counter}' // 두 값을 곱한 값 표시
                : '$_first_counter  $_second_counter', // 첫 번째, 두 번째 카운터
            textAlign: TextAlign.center, // 텍스트를 중앙에 배치
            style: TextStyle(fontSize: 48, color: Colors.black),
          ),
        ),
      ),
    );
  }
}
