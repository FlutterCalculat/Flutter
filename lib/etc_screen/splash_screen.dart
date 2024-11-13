import 'dart:async';
import 'package:flutter/material.dart';
import 'package:adder/view/bottom_nav_view.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 2초 후에 AdditionScreen으로 이동
    Timer(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(_createRoute());
    });
  }

  // 커스텀 애니메이션이 적용된 Route 생성 함수
  Route _createRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => BottomNavigationBarExample(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        // 애니메이션의 시작과 끝 위치
        const begin = Offset(0.0, 1.0); // 오른쪽에서 시작
        const end = Offset.zero; // 화면 중앙으로 이동
        var curve = Curves.easeInOut; // 애니메이션 커브 설정

        // Tween을 사용하여 애니메이션 위치 설정
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        var offsetAnimation = animation.drive(tween);

        // 애니메이션 효과 적용
        return SlideTransition(
          position: offsetAnimation,
          child: child,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Scaffold(
          body: Center(
            child: Container(
              width: double.infinity,
              height: double.infinity,
              color: Colors.black,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      '계산기', // 스플래시 화면에 표시할 텍스트 또는 로고
                      style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                    ),
                    Icon(Icons.abc, color: Colors.white, size: 60,)
                  ]
              ),
            ),
          ),
        ),
      ),
    );
  }
}
