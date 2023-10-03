import 'dart:math';
import 'package:flutter/material.dart';

class FirstChallenge extends StatefulWidget {
  const FirstChallenge({super.key});

  @override
  State<FirstChallenge> createState() => _FirstChallengeState();
}

class _FirstChallengeState extends State<FirstChallenge>
    with TickerProviderStateMixin {
  final random = Random();

  late List<AnimationController> controllers;
  late List<Animation<double>> translations;
  late List<Animation<double>> skews;

  List<Color> baseColors = [
    const Color(0xFFFFAE11),
    const Color(0xFFEE4138),
    const Color(0xFF1FA0AA),
    const Color(0xFFDFDFC4),
  ];

  @override
  void initState() {
    super.initState();

    controllers = List.generate(
        100,
        (i) => AnimationController(
              vsync: this,
              duration: Duration(milliseconds: random.nextInt(800) + 500),
            )..repeat(reverse: true));

    translations = List.generate(
        100,
        (i) => Tween<double>(
              begin: -random.nextDouble() * 5,
              end: random.nextDouble() * 10,
            ).animate(controllers[i]));

    skews = List.generate(
        100,
        (i) => Tween<double>(
              begin: -random.nextDouble() / 200,
              end: random.nextDouble() / 200,
            ).animate(controllers[i]));
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

            const center = 5; // Assuming 10x10 grid
            final dx = (index % 10) - center;
            final dy = (index ~/ 10) - center;
            final distanceFromCenter = sqrt(dx * dx + dy * dy).toDouble();

            return AnimatedBuilder(
              animation: controllers[index],
              builder: (BuildContext context, Widget? child) {
                return Transform.translate(
                  offset: Offset(
                    dx * translations[index].value * distanceFromCenter / 20,
                    dy * translations[index].value * distanceFromCenter / 20,
                  ),
                  child: Transform(
                    transform: Matrix4.skew(
                      dx * skews[index].value * distanceFromCenter,
                      dy * skews[index].value * distanceFromCenter,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(2.0),
                        color: color,
                      ),
                    ),
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

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
