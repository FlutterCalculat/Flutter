import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String name;
  final String type;

  const CustomAppBar({
    required this.name,
    required this.type,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Text("$name의 $type", style: TextStyle(fontSize: 24))),
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(56.0);
}
