import 'dart:math';

import 'package:flutter/material.dart';

class StwoCardChallenge extends StatefulWidget {
  const StwoCardChallenge({super.key});

  @override
  State<StwoCardChallenge> createState() => _StwoCardChallengeState();
}

class _StwoCardChallengeState extends State<StwoCardChallenge>
    with TickerProviderStateMixin {
  late final size = MediaQuery.of(context).size;
  String _resultText = "";
  double get progress => (_index + 1) / 11.0;

  late final AnimationController _position = AnimationController(
    vsync: this,
    duration: const Duration(seconds: 1),
    lowerBound: (size.width + 100) * -1,
    upperBound: (size.width + 100),
    value: 0.0,
  );

  late final Tween<double> _rotation = Tween(
    begin: -15,
    end: 15,
  );

  late final Tween<double> _scale = Tween(
    begin: 0.8,
    end: 1.0,
  );

  late final AnimationController _colorController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 500),
  );

  late final ColorTween _colorTween = ColorTween(
    begin: Colors.grey.shade900,
    end: Colors.grey.shade900,
  );

  late final Animation<Color?> _backgroundColorAnimation =
      _colorTween.animate(_colorController)
        ..addListener(() {
          setState(() {});
        });

  void _changeBackgroundColor() {
    double swipeRatio = _position.value / size.width;
    if (swipeRatio > 0) {
      _colorTween.begin = Colors.grey.shade900;
      _colorTween.end = Colors.green.shade400;
      _resultText = "맞췄다!";
      _colorController.value = swipeRatio * 3;
    } else {
      _colorTween.begin = Colors.grey.shade900;
      _colorTween.end = Colors.red.shade400;
      _resultText = "틀렸다ㅠㅠ";
      _colorController.value = -swipeRatio * 3;
    }
  }

  void _onHorizontalDragUpdate(DragUpdateDetails details) {
    _position.value += details.delta.dx;
    _changeBackgroundColor();
  }

  void _onHorizontalDragEnd(DragEndDetails details) {
    final bound = size.width - 200;
    final dropZone = size.width + 100;
    if (_position.value.abs() >= bound) {
      final factor = _position.value.isNegative ? -1 : 1;
      _position
          .animateTo((dropZone) * factor, curve: Curves.easeOut)
          .whenComplete(() {
        _position.value = 0;
        setState(() {
          _index = _index == 10 ? 0 : _index + 1;
        });
      });
    } else {
      _position.animateTo(
        0,
        curve: Curves.easeOut,
      );
    }
    _colorTween.end = Colors.grey.shade900;
    _colorController.animateTo(0.0,
        duration: const Duration(milliseconds: 300)); // 애니메이션을 초기 상태로 되돌림
    _resultText = "";
  }

  @override
  void dispose() {
    _position.dispose();
    super.dispose();
  }

  int _index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _backgroundColorAnimation.value,
      appBar: AppBar(
        backgroundColor: _backgroundColorAnimation.value,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back),
        ),
        title: const Column(
          children: [
            Text(
              '얼굴 보고 판다 맞추기',
              style: TextStyle(
                fontSize: 26,
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '사진: 내셔널바오그래피',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white70,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
      ),
      body: AnimatedBuilder(
        animation: _position,
        builder: (context, child) {
          final angle = _rotation.transform(
                (_position.value + size.width / 2) / size.width,
              ) *
              pi /
              180;
          final scale = _scale.transform(_position.value.abs() / size.width);
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Positioned(
                  top: 20,
                  child: Text(
                    _resultText,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                    ),
                  )),
              Positioned(
                top: 60,
                child: Transform.scale(
                  scale: min(scale, 1.0),
                  child: Card(index: _index == 10 ? 0 : _index + 1),
                ),
              ),
              Positioned(
                top: 60,
                child: GestureDetector(
                  onHorizontalDragUpdate: _onHorizontalDragUpdate,
                  onHorizontalDragEnd: _onHorizontalDragEnd,
                  child: Transform.translate(
                    offset: Offset(_position.value, 0),
                    child: Transform.rotate(
                        angle: angle,
                        child: Card(
                          index: _index,
                        )),
                  ),
                ),
              ),
              Positioned(
                bottom: 80,
                child: SizedBox(
                  width: size.width * 0.8,
                  child: CustomPaint(
                    painter: ProgressPainter(progress: progress),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class Card extends StatefulWidget {
  const Card({super.key, required this.index});

  final int index;

  @override
  State<Card> createState() => _CardState();
}

class _CardState extends State<Card> with SingleTickerProviderStateMixin {
  bool _flipped = false;
  late final AnimationController _flipController;
  late final Animation<double> _flipAnimation;

  @override
  void didUpdateWidget(covariant Card oldWidget) {
    super.didUpdateWidget(oldWidget);

    // 현재 카드의 인덱스와 이전 카드의 인덱스가 다른 경우
    if (widget.index != oldWidget.index) {
      // _flipped 상태와 애니메이션 컨트롤러를 초기화
      _flipped = false;
      _flipController.reset();
    }
  }

  @override
  void initState() {
    super.initState();
    _flipController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
    _flipAnimation = Tween<double>(begin: 0, end: pi).animate(_flipController);
    _flipped = false;
  }

  @override
  void dispose() {
    _flipController.dispose();
    super.dispose();
  }

  _onTap() {
    if (_flipped) {
      _flipController.reverse();
    } else {
      _flipController.forward();
    }
    setState(() {
      _flipped = !_flipped;
    });
  }

  final _answer = [
    {
      "name": "푸바오",
    },
    {
      "name": "아이바오",
    },
    {
      "name": "러바오",
    },
    {
      "name": "후이바오",
    },
    {
      "name": "푸바오",
    },
    {
      "name": "러바오",
    },
    {
      "name": "아이바오",
    },
    {
      "name": "루이바오",
    },
    {
      "name": "루이바오",
    },
    {
      "name": "러바오",
    },
    {
      "name": "아이바오",
    },
  ];

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: _onTap,
      child: AnimatedBuilder(
        animation: _flipAnimation,
        builder: (context, child) {
          return Transform(
            alignment: Alignment.center,
            transform: Matrix4.identity()
              ..setEntry(3, 2, 0.001) // perspective
              ..rotateY(_flipAnimation.value),
            child: _flipAnimation.value >= pi / 2
                ? Transform(
                    alignment: Alignment.center,
                    transform: Matrix4.identity()
                      ..rotateY(pi), // Text를 똑바로 표시하기 위해 반대 방향으로 회전
                    child: Material(
                      elevation: 4,
                      borderRadius: BorderRadius.circular(20),
                      clipBehavior: Clip.hardEdge,
                      child: SizedBox(
                        width: size.width * 0.8,
                        height: size.height * 0.58,
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                "${_answer[widget.index]["name"]}",
                                style: const TextStyle(
                                  fontSize: 28,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  )
                : Material(
                    elevation: 4,
                    borderRadius: BorderRadius.circular(20),
                    clipBehavior: Clip.hardEdge,
                    child: SizedBox(
                      width: size.width * 0.8,
                      height: size.height * 0.58,
                      child: Image.asset(
                        "assets/baos/${widget.index}.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
          );
        },
      ),
    );
  }
}

class ProgressPainter extends CustomPainter {
  final double progress;

  ProgressPainter({required this.progress});

  @override
  void paint(Canvas canvas, Size size) {
    final Paint backgroundPaint = Paint()
      ..color = Colors.white24
      ..style = PaintingStyle.fill;

    final Paint progressPaint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;

    final double width = size.width;
    const double height = 10.0;
    const double borderRadius = height / 2; // 반원 형태를 위해 높이의 절반을 사용

    // 배경
    final RRect backgroundRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, width, height),
      const Radius.circular(borderRadius),
    );
    canvas.drawRRect(backgroundRRect, backgroundPaint);

    // 현재의 진행률에 따른 사각형
    final RRect progressRRect = RRect.fromRectAndRadius(
      Rect.fromLTWH(0, 0, width * progress, height),
      const Radius.circular(borderRadius),
    );
    canvas.drawRRect(progressRRect, progressPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return oldDelegate != this;
  }
}
