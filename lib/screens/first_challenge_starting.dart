import 'package:flutter/material.dart';

class FirstChallengeStarting extends StatefulWidget {
  const FirstChallengeStarting({super.key});

  @override
  State<FirstChallengeStarting> createState() => _FirstChallengeStartingState();
}

class _FirstChallengeStartingState extends State<FirstChallengeStarting> {
  List<Color> baseColors = [
    const Color(0xFFFFAE11),
    const Color(0xFFEE4138),
    const Color(0xFF1FA0AA),
    const Color(0xFFDFDFC4),
  ];

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

            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(2.0),
                color: color,
              ),
            );
          },
          itemCount: 100,
        ),
      ),
    );
  }
}
