import 'dart:math';

import 'package:flutter/material.dart';

class SecondChallenge extends StatefulWidget {
  const SecondChallenge({super.key});

  @override
  State<SecondChallenge> createState() => _SecondChallengeState();
}

class _SecondChallengeState extends State<SecondChallenge>
    with TickerProviderStateMixin {
  late AnimationController _whiteTileController;

  late AnimationController _blackTileController;
  late List<Animation<double>> _animations;
  List<Animation<double>> _afterImages = [];
  bool _isBlackAnimating = false;

  @override
  void initState() {
    super.initState();

    _whiteTileController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
      upperBound: 0.5,
    );

    _blackTileController = AnimationController(
      duration: const Duration(milliseconds: 1800),
      vsync: this,
      upperBound: 0.5,
    );

    _whiteTileController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _whiteTileController.reset();

        setState(() {
          _isBlackAnimating = true;
        });
        _blackTileController.forward();
      }
    });

    _blackTileController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _blackTileController.reset();
        setState(() {
          _isBlackAnimating = false;
        });
        _whiteTileController.forward();
      }
    });

    _whiteTileController.forward();

// _animations 초기화 부분
    _animations = List.generate(64, (i) {
      int row = i ~/ 8;
      int col = i % 8;
      bool isWhite = isWhiteTile(row, col);

      double start;
      double end;
      if (isWhite) {
        int whiteIndex = (row * 8 + col - (row ~/ 2)); // 흰색 타일의 순번 계산
        start = whiteIndex * 0.1 / 36;
        end = start + 2.4 / 32;
        return Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: _whiteTileController,
            curve: Interval(start, end, curve: Curves.easeOut),
          ),
        );
      } else {
        int blackIndex = (row * 8 + col - (row ~/ 2)); // 검정색 타일의 순번 계산
        start = blackIndex * 0.1 / 36;
        end = start + 2.4 / 32;
        return Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: _blackTileController,
            curve: Interval(start, end, curve: Curves.easeOut),
          ),
        );
      }
    });

    _afterImages = List.generate(64, (i) {
      int row = i ~/ 8;
      int col = i % 8;
      bool isWhite = isWhiteTile(row, col);

      double start;
      double end;
      double delay = 0.01; // 20ms delay for after image
      if (isWhite) {
        int whiteIndex = (row * 8 + col - (row ~/ 2));
        start = max(0, whiteIndex * 0.1 / 36 - delay);
        end = min(1, start + 2.4 / 32);

        return Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: _whiteTileController,
            curve: Interval(start, end, curve: Curves.easeOut),
          ),
        );
      } else {
        int blackIndex = (row * 8 + col - (row ~/ 2));
        start = max(0, blackIndex * 0.1 / 36 - delay);
        end = min(1, start + 2.4 / 32);

        return Tween<double>(begin: 0, end: 1).animate(
          CurvedAnimation(
            parent: _blackTileController,
            curve: Interval(start, end, curve: Curves.easeOut),
          ),
        );
      }
    });
  }

  bool isWhiteTile(int row, int col) {
    return (row % 2 == 0 && col % 2 == 0) || (row % 2 == 1 && col % 2 == 1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF262626),
      appBar: AppBar(
        backgroundColor: const Color(0xFF262626),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Second Challenge'),
      ),
      body: Container(
        height: 393,
        decoration: BoxDecoration(
          color: _isBlackAnimating
              ? const Color(0xFFDCDCCD)
              : const Color(0xFF262626),
        ),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 8,
          ),
          itemBuilder: (context, index) {
            int row = index ~/ 8;
            int col = index % 8;
            bool isWhite = isWhiteTile(row, col);

            return Stack(
              children: [
// Top Animated Tile
                Stack(
                  children: [
                    AnimatedBuilder(
                      animation:
                          isWhite ? _whiteTileController : _blackTileController,
                      builder: (context, child) {
                        return Transform.rotate(
                          angle: 0.5 * 3.14 * _animations[index].value,
                          child: Container(
                            color: isWhite
                                ? _isBlackAnimating
                                    ? Colors.transparent
                                    : const Color(0xFFDCDCCD)
                                : _isBlackAnimating
                                    ? const Color(0xFF262626)
                                    : Colors.transparent,
                          ),
                        );
                      },
                    ),
                    AnimatedBuilder(
                      animation:
                          isWhite ? _whiteTileController : _blackTileController,
                      builder: (context, child) {
                        return Opacity(
                          opacity: 0.3,
                          child: Transform.rotate(
                            angle: 0.5 * 3.14 * _afterImages[index].value,
                            child: Container(
                              color: isWhite
                                  ? _isBlackAnimating
                                      ? Colors.transparent
                                      : const Color(0xFFDCDCCD)
                                  : _isBlackAnimating
                                      ? const Color(0xFF262626)
                                      : Colors.transparent,
                            ),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ],
            );
          },
          itemCount: 64,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _whiteTileController.dispose();
    _blackTileController.dispose();
    super.dispose();
  }
}
