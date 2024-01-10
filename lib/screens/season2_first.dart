import 'package:flutter/material.dart';

class StwoFirst extends StatefulWidget {
  const StwoFirst({super.key});

  @override
  State<StwoFirst> createState() => _StwoFirstState();
}

class _StwoFirstState extends State<StwoFirst> {
  bool isRectAtRight = false;
  bool isCircle = true;
  Color backgroundColor = Colors.white;
  Color rectangleColor = Colors.black;

  @override
  void initState() {
    super.initState();
    startAnimation();
  }

  void startAnimation() async {
    while (true) {
      await Future.delayed(const Duration(milliseconds: 1000));
      toggleAnimation();
    }
  }

  void toggleAnimation() {
    setState(() {
      if (isRectAtRight) {
        // 직사각형이 오른쪽 끝에 도달했을 때
        backgroundColor = Colors.black;
        rectangleColor = Colors.white;
        isCircle = false; // 원에서 사각형으로
      } else {
        // 직사각형이 왼쪽 끝에 도달했을 때
        backgroundColor = Colors.white;
        rectangleColor = Colors.black;
        isCircle = true; // 사각형에서 원으로
      }
      isRectAtRight = !isRectAtRight;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: Center(
        child: Stack(
          alignment: Alignment.center,
          children: [
            Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(isCircle ? 100 : 0),
                color: Colors.red.shade400,
              ),
            ),
            TweenAnimationBuilder<double>(
              tween: Tween(begin: -1.0, end: isRectAtRight ? 1.0 : -1.0),
              duration: const Duration(milliseconds: 1500),
              onEnd: toggleAnimation,
              builder: (context, value, child) {
                return Align(
                  alignment: Alignment(value, 0),
                  child: Container(
                    width: 10,
                    height: 200,
                    color: rectangleColor,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
