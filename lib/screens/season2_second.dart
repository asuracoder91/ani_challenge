import 'package:flutter/material.dart';

class StwoSecondChallenge extends StatefulWidget {
  const StwoSecondChallenge({super.key});

  @override
  State<StwoSecondChallenge> createState() => _StwoSecondChallenge();
}

class _StwoSecondChallenge extends State<StwoSecondChallenge>
    with TickerProviderStateMixin {
  late List<Animation<Decoration>> _tileAnimations;
  late List<Animation<Decoration>> _showTileAnimations;
  late AnimationController _controller;

  late AnimationController _secondController;

  final BoxDecoration _redBox = BoxDecoration(
    color: Colors.red,
    borderRadius: BorderRadius.circular(3),
  );

  final BoxDecoration _blackBox = BoxDecoration(
    color: Colors.red.withOpacity(0.1),
    borderRadius: BorderRadius.circular(0),
  );

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
      duration: const Duration(milliseconds: 1200),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.forward) {
          Future.delayed(const Duration(milliseconds: 600), () {
            _secondController.forward();
          });
        }
        if (status == AnimationStatus.completed) {
          _controller.reset();
          _controller.forward();
        }
      });
    _secondController = AnimationController(
      duration: const Duration(milliseconds: 600),
      vsync: this,
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _secondController.reset();
          _controller.forward();
        }
      });
    _tileAnimations = List<Animation<Decoration>>.generate(25, (i) {
      int index = animationOrder.indexOf(i);
      double start = index * (2 / 100.0);
      double end = start + 0.5;
      return DecorationTween(
        begin: _redBox,
        end: _blackBox,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: Interval(start, end, curve: Curves.easeOutQuart),
        ),
      );
    });

    _showTileAnimations = List<Animation<Decoration>>.generate(25, (i) {
      int index = animationOrder.indexOf(i);
      double start = index * (2 / 100.0);
      double end = start + 0.01;
      return DecorationTween(
        begin: _blackBox,
        end: _redBox,
      ).animate(
        CurvedAnimation(
          parent: _secondController,
          curve: Interval(start, end, curve: Curves.linear),
        ),
      );
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
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.all(20.0),
            width: 24,
            height: 24,
            child: DecoratedBoxTransition(
              decoration: _showTileAnimations[index],
              child: DecoratedBoxTransition(
                decoration: _tileAnimations[index],
                child: const Center(
                    // child: Text(
                    //   '$index',
                    //   style: const TextStyle(color: Colors.white),
                    // ),
                    ),
              ),
            ),
          );
        },
        itemCount: 25,
      ),
    );
  }
}
