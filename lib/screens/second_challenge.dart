import 'package:flutter/material.dart';

class SecondChallenge extends StatefulWidget {
  const SecondChallenge({super.key});

  @override
  _SecondChallengeState createState() => _SecondChallengeState();
}

class _SecondChallengeState extends State<SecondChallenge>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 103),
      vsync: this,
    )..repeat();

    _animations = List.generate(64, (i) {
      double start = i * 0.1 / 32;
      double end = start + 0.1; // Reduce duration for each tile
      return Tween<double>(begin: 0, end: 1).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.linear),
        ),
      );
    });
  }

  bool isWhiteTile(int row, int col) {
    return (row % 2 == 1 && col % 2 == 0) || (row % 2 == 0 && col % 2 == 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF262626),
      body: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 8,
        ),
        itemBuilder: (context, index) {
          int row = index ~/ 8;
          int col = index % 8;
          bool isWhite = isWhiteTile(row, col);

          return Stack(
            children: [
              // Bottom Tile
              Container(
                color:
                    isWhite ? const Color(0xFF262626) : const Color(0xFFDCDCCD),
              ),
              // Top Animated Tile
              AnimatedBuilder(
                animation: _controller,
                builder: (context, child) {
                  if ((isWhite &&
                          _animations[row * 4 + col ~/ 2].value <= 0.5) ||
                      (!isWhite &&
                          _animations[row * 4 + col ~/ 2].value < 0.75)) {
                    return Container(
                        color: isWhite
                            ? const Color(0xFFDCDCCD)
                            : const Color(0xFF262626));
                  }
                  return Transform.rotate(
                    angle: 2 *
                        3.14 *
                        (_animations[row * 4 + col ~/ 2].value % 0.25) *
                        4,
                    child: Container(
                        color: isWhite
                            ? const Color(0xFFDCDCCD)
                            : const Color(0xFF262626)),
                  );
                },
              ),
            ],
          );
        },
        itemCount: 64,
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
