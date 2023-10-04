import 'package:flutter/material.dart';

class SecondChallenge extends StatefulWidget {
  const SecondChallenge({super.key});

  @override
  _SecondChallengeState createState() => _SecondChallengeState();
}

class _SecondChallengeState extends State<SecondChallenge>
    with TickerProviderStateMixin {
  late AnimationController _whiteTileController;

  late AnimationController _blackTileController;
  late List<Animation<double>> _animations;

  @override
  void initState() {
    super.initState();

    _whiteTileController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _blackTileController = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    );

    _whiteTileController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _whiteTileController.reset();
        _blackTileController.forward();
      }
    });

    _blackTileController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _blackTileController.reset();
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
  }

  bool isWhiteTile(int row, int col) {
    return (row % 2 == 0 && col % 2 == 0) || (row % 2 == 1 && col % 2 == 1);
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
                animation:
                    isWhite ? _whiteTileController : _blackTileController,
                builder: (context, child) {
                  if (isWhite) {
                    return Transform.rotate(
                      angle: 0.5 * 3.14 * _animations[index].value,
                      child: Container(
                        color: const Color(0xFFDCDCCD),
                      ),
                    );
                  } else {
                    return Transform.rotate(
                      angle: 0.5 * 3.14 * _animations[index].value,
                      child: Container(
                        color: const Color(0xFF262626),
                      ),
                    );
                  }
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
    _whiteTileController.dispose();
    _blackTileController.dispose();
    super.dispose();
  }
}
