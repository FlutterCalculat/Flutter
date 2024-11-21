
import 'package:adder/multiplication/feature/gesture_multiplication.dart';
import 'package:adder/multiplication/feature/rotated_multiplication.dart';
import 'package:flutter/material.dart';



class MultiplicationTab extends StatefulWidget {
  const MultiplicationTab({super.key});

  @override
  State<MultiplicationTab> createState() => _MultiplicationTabState();
}

class _MultiplicationTabState extends State<MultiplicationTab> with TickerProviderStateMixin {
  TabController? controller;
  @override
  void initState() {
    super.initState();
    controller = TabController(length: 2, vsync: this);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        TabBarView(controller: controller, children: renderChildren()),
        Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(onPressed: (){
                print(0);
                setState(() {
                  controller!.animateTo(0);
                });
              }, icon: Icon(Icons.arrow_back_ios_outlined)),
              Expanded(child: SizedBox()),
              IconButton(onPressed: (){
                print(1);
                setState(() {

                  controller!.animateTo(1);
                });
              }, icon: Icon(Icons.arrow_forward_ios_outlined)),
            ],
          ),
        ),
      ]),
    );
  }

  List<Widget> renderChildren() {
    return [
      Container(
        child: GestureMultiplication()
      ),
      Container(
          child: RotatedMultiplication()
      )
    ];
  }
}
