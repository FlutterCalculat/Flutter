import 'package:flutter/material.dart';

class SubtractAnimator extends StatefulWidget {
  const SubtractAnimator({super.key});

  @override
  _SubtractAnimatorState createState() => _SubtractAnimatorState();
}

class _SubtractAnimatorState extends State<SubtractAnimator>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;  // 애니메이션 컨트롤러
  late Animation<double> _fadeAnimation;  // 페이드 애니메이션

  List<int> numbers = [];  // 뺄셈에 사용할 숫자 리스트
  List<String> formula = [];  // 수식 리스트
  int currentResult = 0;  // 현재 계산 결과
  int currentIndex = 0;  // 현재 애니메이션 인덱스
  bool isAnimating = false;  // 애니메이션 진행 중인지 여부
  bool isCompleted = false;  // 애니메이션이 완료되었는지 여부
  final TextEditingController _inputController = TextEditingController();  // 입력 필드 컨트롤러

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),  // 애니메이션 지속 시간 설정
    );
    _fadeAnimation = CurvedAnimation(parent: _controller, curve: Curves.easeInOut);  // 부드러운 애니메이션 커브 설정
  }

  // 입력값을 업데이트하는 함수
  void updateValues() {
    setState(() {
      final input = _inputController.text.trim();  // 입력값 가져오기
      final values = input.split('-').map((e) => int.tryParse(e.trim()) ?? 0).toList();  // "-"를 기준으로 숫자 분리
      if (values.isNotEmpty) {
        currentResult = values.first;  // 첫 번째 값은 결과로 설정
        numbers = values.sublist(1);  // 첫 번째 값을 제외한 나머지는 뺄셈 숫자로 설정
        formula = ['${values.first}'] + values.sublist(1).map((e) => '-$e').toList();  // 수식 리스트 생성
        currentIndex = 0;  // 인덱스 초기화
        isCompleted = false;  // 애니메이션 완료 상태 초기화
      }
    });
  }

  // 애니메이션을 시작하는 함수
  void startAnimation() {
    if (currentIndex >= numbers.length) return;  // 모든 숫자가 처리되었으면 종료

    setState(() {
      isAnimating = true;  // 애니메이션 진행 중 상태 설정
    });

    // 애니메이션 실행 후 처리
    _controller.forward(from: 0).then((_) {
      setState(() {
        currentResult -= numbers[currentIndex];  // 현재 숫자를 결과에서 빼기
        formula.removeAt(currentIndex + 1);  // 수식에서 현재 숫자 제거
        numbers.removeAt(currentIndex);  // 숫자 리스트에서 현재 숫자 제거
        _controller.reset();  // 애니메이션 리셋
      });

      if (currentIndex < numbers.length) {
        startAnimation();  // 계속 애니메이션 실행
      } else {
        setState(() {
          isAnimating = false;  // 애니메이션 완료 상태 설정
          isCompleted = true;  // 완료 상태 설정
        });
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();  // ���니메이션 컨트롤러 해제
    _inputController.dispose();  // 입력 필드 컨트롤러 해제
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 입력 필드
            TextField(
              controller: _inputController,
              decoration: const InputDecoration(labelText: 'Input (e.g., 10-4-3-2-1)'),
              keyboardType: TextInputType.text,
            ),
            // 값 업데이트 버튼
            ElevatedButton(
              onPressed: isAnimating ? null : updateValues, // 애니메이션이 진행 중이면 버튼 비활성화
              child: const Text('Update Values'),
            ),
            const SizedBox(height: 20),
            // 결과 및 수식을 보여주는 애니메이션
            AnimatedBuilder(
              animation: _fadeAnimation,
              builder: (context, child) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // 현재 결과 출력
                    Expanded(
                      child: SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            Text(
                              '$currentResult',
                              style: TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                                color: isCompleted ? Colors.green : Colors.black,  // 완료되면 초록색, 아니면 검정색
                                fontFamily: 'NanumSquareRound',
                              ),
                            ),
                            for (int i = 1; i < formula.length; i++) ...[
                              Text(
                                ' ${formula[i]}',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.bold,
                                  color: i - 1 == currentIndex
                                      ? Colors.red.withOpacity(1 - _fadeAnimation.value)  // 현재 인덱스에 해당하는 숫자는 빨간색으로 강조
                                      : Colors.black,
                                  fontFamily: 'NanumSquareRound',
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
            const SizedBox(height: 20),
            // 애니메이션 시작 버튼
            ElevatedButton(
              onPressed: isAnimating ? null : startAnimation,  // 애니메이션이 진행 중이면 버튼 비활성화
              child: const Text('='),
            ),
          ],
        ),
      ),
    );
  }
}

void main() {
  runApp(const MaterialApp(
    home: SubtractAnimator(),
  ));
}