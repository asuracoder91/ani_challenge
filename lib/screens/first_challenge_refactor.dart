import 'dart:math';
import 'package:flutter/material.dart';

class FirstChallengeRefactor extends StatefulWidget {
  const FirstChallengeRefactor({super.key});

  @override
  State<FirstChallengeRefactor> createState() => _FirstChallengeRefactorState();
}

class _FirstChallengeRefactorState extends State<FirstChallengeRefactor> {
  final random = Random();

  late List<Duration> durations;
  late List<double> beginTranslations;
  late List<double> endTranslations;
  late List<double> beginSkews;
  late List<double> endSkews;

  List<Color> baseColors = [
    const Color(0xFFFFAE11),
    const Color(0xFFEE4138),
    const Color(0xFF1FA0AA),
    const Color(0xFFDFDFC4),
  ];

  @override
  void initState() {
    super.initState();

    durations = List.generate(
        100, (i) => Duration(milliseconds: random.nextInt(800) + 500));
    beginTranslations = List.generate(100, (i) => -random.nextDouble() * 5);
    endTranslations = List.generate(100, (i) => random.nextDouble() * 10);
    beginSkews = List.generate(100, (i) => -random.nextDouble() / 150);
    endSkews = List.generate(100, (i) => random.nextDouble() / 250);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF2B2F2D),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        backgroundColor: const Color(0xFF2B2F2D),
        title: const Text(
          'Challenge 1',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 10,
            mainAxisSpacing: 10.0,
            crossAxisSpacing: 10.0,
          ),
          itemBuilder: (context, index) {
            Color color;
            if ((index ~/ 10) % 2 == 0) {
              color = baseColors[(index % 2)];
            } else {
              color = baseColors[2 + (index % 2)];
            }

            const center = 5;
            final dx = (index % 10) - center;
            final dy = (index ~/ 10) - center;
            final distanceFromCenter = sqrt(dx * dx + dy * dy).toDouble();

            return TweenAnimationBuilder<double>(
              tween: Tween<double>(
                begin: beginTranslations[index],
                end: endTranslations[index],
              ),
              duration: durations[index],
              curve: Curves.linear,
              onEnd: () {
                setState(() {
                  double tempTrans = beginTranslations[index];
                  beginTranslations[index] = endTranslations[index];
                  endTranslations[index] = tempTrans;
                });
              },
              builder:
                  (BuildContext context, double transValue, Widget? child) {
                return Transform.translate(
                  offset: Offset(
                    dx * transValue * distanceFromCenter / 20,
                    dy * transValue * distanceFromCenter / 20,
                  ),
                  child: TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: beginSkews[index],
                      end: endSkews[index],
                    ),
                    duration: durations[index],
                    curve: Curves.linear,
                    onEnd: () {
                      setState(() {
                        double tempSkew = beginSkews[index];
                        beginSkews[index] = endSkews[index];
                        endSkews[index] = tempSkew;
                      });
                    },
                    builder:
                        (BuildContext context, double skewValue, Widget? _) {
                      return Transform(
                        transform: Matrix4.skew(
                          dx * skewValue * distanceFromCenter,
                          dy * skewValue * distanceFromCenter,
                        ),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(2.0),
                            color: color,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }
}
