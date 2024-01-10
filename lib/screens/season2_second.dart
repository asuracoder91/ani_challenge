import 'package:flutter/material.dart';

class StwoSecondChallenge extends StatefulWidget {
  const StwoSecondChallenge({super.key});

  @override
  State<StwoSecondChallenge> createState() => _StwoSecondChallenge();
}

class _StwoSecondChallenge extends State<StwoSecondChallenge>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late List<Animation> _tileAnimations;
  late AnimationController _secondController;
  late List<Animation> _secondTileAnimations;
  bool secondAnimationTrigger = false;

  List<int> animationOrder = [
    24,
    23,
    22,
    21,
    20,
    15,
    16,
    17,
    18,
    19,
    14,
    13,
    12,
    11,
    10,
    5,
    6,
    7,
    8,
    9,
    4,
    3,
    2,
    1,
    0
  ];

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _secondController = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    );

    _tileAnimations = List.generate(25, (i) {
      int index = animationOrder.indexOf(i);
      double start = index * (2 / 100.0);

      double end = start + 0.5;
      if (i == 2) {
        _secondController.forward();
      }
      return ColorTween(begin: Colors.red, end: Colors.red.withOpacity(0.1))
          .animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeOutQuart),
        ),
      );
    });

    // _secondTileAnimations 구현

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _secondController.forward();
      }
    });

    _secondController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.forward();
      }
    });

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _secondController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Second Challenge'),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 5),
        itemBuilder: (context, index) => AnimatedBuilder(
          animation: _controller.isAnimating
              ? _tileAnimations[index]
              : _secondTileAnimations[index],
          builder: (context, child) {
            return Container(
              margin: const EdgeInsets.all(20.0),
              width: 24,
              height: 24,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(3),
                color: _controller.isAnimating
                    ? _tileAnimations[index].value
                    : _secondTileAnimations[index].value,
              ),
              child: Center(
                  child: Text(
                '$index',
                style: const TextStyle(color: Colors.white),
              )),
            );
          },
          child: Container(),
        ),
        itemCount: 25,
      ),
    );
  }
}
