import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String type;
  final Color background;

  const CustomAppBar({
    required this.name,
    required this.type,
    this.background = Colors.white,
  });

  Color _getTextColor(Color background) {
    if(background == Colors.white){
      return Colors.black;
    }else{
      return Colors.white;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color textColor = _getTextColor(background);

    return Container(
      width: double.infinity,
      color: background,
      child: Center(
        child: Padding(
          padding: EdgeInsets.only(top: 20),
          child: Text(
            "$name의 $type",
            style: TextStyle(fontSize: 24, color: textColor),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
