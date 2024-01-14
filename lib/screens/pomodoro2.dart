import 'dart:async';

import 'dart:math' as math;
import 'package:flutter/material.dart';

class Pomodoro2 extends StatefulWidget {
  const Pomodoro2({super.key});

  @override
  State<Pomodoro2> createState() => _Pomodoro2State();
}

class _Pomodoro2State extends State<Pomodoro2> {
  int targetMinutes = 1200;
  int totalSeconds = 0;
  late Timer timer;
  bool isRunning = false;
  int totalPomodoros = 0;

  int selectedTime = 1200;

  void setTime(int minutes) {
    setState(() {
      targetMinutes = minutes;
      selectedTime = minutes;
    });
  }

  void onTick(Timer timer) {
    if (totalSeconds == targetMinutes) {
      setState(() {
        totalPomodoros++;
        isRunning = false;
        totalSeconds = 0;
      });
      timer.cancel();
    } else {
      setState(() {
        totalSeconds++;
      });
    }
  }

  void onStartPressed() {
    timer = Timer.periodic(
      const Duration(milliseconds: 1),
      onTick,
    );
    setState(() {
      isRunning = true;
    });
  }

  void onPausePressed() {
    timer.cancel();
    setState(() {
      isRunning = false;
    });
  }

  void onResetPressed() {
    timer.cancel();
    setState(() {
      totalPomodoros = 0;
      totalSeconds = 0;
      isRunning = false;
    });
  }

  void onStopPressed() {
    timer.cancel();
    setState(() {
      totalSeconds = 0;
      isRunning = false;
    });
  }

  String format(int seconds) {
    var duration = Duration(seconds: seconds);
    return duration.toString().split(".").first.substring(2, 7);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFFE8DEF8),
            Colors.white,
          ], // Replace with desired colors
        ),
      ),
      child: Column(
        children: [
          Flexible(
            flex: 4,
            child: CustomPaint(
              painter: DrawCircle(totalSeconds / targetMinutes),
              size: const Size(240, 240),
              child: Center(
                child: Text(
                  format(totalSeconds),
                  style: const TextStyle(
                      color: Color(0xff4d3c93),
                      fontSize: 52,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TimerButton(
                  timerText: "5분",
                  onPressed: () => setTime(300),
                  isSelected: selectedTime == 300,
                ),
                TimerButton(
                  timerText: "10분",
                  onPressed: () => setTime(600),
                  isSelected: selectedTime == 600,
                ),
                TimerButton(
                  timerText: "15분",
                  onPressed: () => setTime(900),
                  isSelected: selectedTime == 900,
                ),
                TimerButton(
                  timerText: "20분",
                  onPressed: () => setTime(1200),
                  isSelected: selectedTime == 1200,
                ),
              ],
            ),
          ),
          Flexible(
            flex: 2,
            child: Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfff9f8fb),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.refresh),
                      onPressed: () {
                        onResetPressed();
                      },
                      iconSize: 28,
                      color: const Color(0xff6750a4),
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    width: 84,
                    height: 84,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xff6750a4),
                    ),
                    child: IconButton(
                      icon: Icon(
                          isRunning ? Icons.pause : Icons.play_arrow_rounded),
                      onPressed: () {
                        isRunning ? onPausePressed() : onStartPressed();
                      },
                      iconSize: 48,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 20),
                  Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Color(0xfff9f8fb),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.stop),
                      onPressed: () {
                        onStopPressed();
                      },
                      iconSize: 28,
                      color: const Color(0xff6750a4),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            flex: 1,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).cardColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          topRight: Radius.circular(50),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text('Pomodoros',
                              style: TextStyle(
                                fontSize: 24,
                                color: Color(0xff6750a4),
                              )),
                          Text('$totalPomodoros',
                              style: const TextStyle(
                                fontSize: 24,
                                color: Color(0xff6750a4),
                              )),
                        ],
                      )),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}

class TimerButton extends StatelessWidget {
  const TimerButton({
    super.key,
    required this.timerText,
    required this.onPressed,
    this.isSelected = false,
  });

  final String timerText;
  final VoidCallback onPressed;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      child: TextButton(
        onPressed: onPressed,
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
            horizontal: 0,
            vertical: 0,
          ),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 2,
          ),
          decoration: BoxDecoration(
            color: Colors.purple.shade100,
            borderRadius: BorderRadius.circular(16),
            border: isSelected
                ? Border.all(color: Colors.purple.shade300, width: 3)
                : Border.all(color: Colors.transparent, width: 3),
          ),
          child: Text(timerText, style: const TextStyle(fontSize: 18)),
        ),
      ),
    );
  }
}

class DrawCircle extends CustomPainter {
  final double progress;

  DrawCircle(this.progress);

  @override
  void paint(Canvas canvas, Size size) {
    final offset = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2.5;

    // 기본 그림자 원
    final circleShadowPaint = Paint()
      ..color = const Color(0xfff9f8fb)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;
    canvas.drawCircle(offset, radius, circleShadowPaint);

    // 진행 상태 원
    final circlePaint = Paint()
      ..color = const Color(0xff4d3c93)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..strokeCap = StrokeCap.round;
    final rect = Rect.fromCircle(center: offset, radius: radius);
    canvas.drawArc(
        rect, -math.pi / 2, 2 * math.pi * progress, false, circlePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
