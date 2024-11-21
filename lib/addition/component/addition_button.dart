import 'package:flutter/material.dart';

class AdditionButton extends StatelessWidget {
  final String text;
  final Color color;
  final Color textColor;
  final int flex;
  final Function(String) onPressed; // 버튼 클릭 콜백

  AdditionButton({
    required this.text,
    required this.onPressed,
    this.color = const Color(0xFF333333),
    this.textColor = Colors.white,
    this.flex = 1,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: flex,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GestureDetector(
          onTap: () => onPressed(text),
          child: Container(
            height: 80,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Center(
              child: Text(
                text,
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
