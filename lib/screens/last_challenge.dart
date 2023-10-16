import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:lottie/lottie.dart';

import 'data/painting_data.dart';
import 'util/rotation_3d.dart';

class LastChallenge extends StatefulWidget {
  const LastChallenge({super.key});

  @override
  State<LastChallenge> createState() => _LastChallengeState();
}

class _LastChallengeState extends State<LastChallenge>
    with TickerProviderStateMixin {
  late List<Paint> _paintList;
  final PageController _pageController = PageController(
    viewportFraction: 1.0,
  );
  int _currentPage = 0;
  bool _isDown = false;

  final ValueNotifier<double> _scroll = ValueNotifier<double>(0.0);

  void _onPageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  void _moveDown() {
    setState(() {
      _isDown = true;
    });
  }

  void _moveUp() {
    setState(() {
      _isDown = false;
    });
  }

  @override
  void initState() {
    super.initState();
    var data = DemoData();
    _paintList = data.getPaints();
    _pageController.addListener(() {
      if (_pageController.page == null) return;
      _scroll.value = _pageController.page!;
    });

    _tweenController = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 1000));
    _tween = Tween<double>(begin: -1, end: 0);
    _tweenAnim = _tween.animate(
        CurvedAnimation(parent: _tweenController, curve: Curves.elasticOut))
      ..addListener(() {
        _setOffset(_tweenAnim.value);
      });
  }

  @override
  void dispose() {
    _pageController.dispose();
    _tweenController.dispose();
    super.dispose();
  }

  double _normalizedOffset = 0;
  double _prevScrollX = 0;
  bool _isScrolling = false;

  final double _maxRotation = 20;

  late AnimationController _tweenController;
  late Tween<double> _tween;
  late Animation<double> _tweenAnim;

  void _handlePointerUp(PointerUpEvent event) {
    if (_isScrolling) {
      _isScrolling = false;
      _startOffsetTweenToZero();
    }
  }

  void _startOffsetTweenToZero() {
    // Restart the tweenController and inject a new start value into the tween
    _tween.begin = _normalizedOffset;
    _tweenController.reset();
    _tween.end = 0;
    _tweenController.forward();
  }

  bool _handleScrollNotifications(Notification notification) {
    //Scroll Update, add to our current offset, but clamp to -1 and 1
    if (notification is ScrollUpdateNotification) {
      if (_isScrolling) {
        double dx = notification.metrics.pixels - _prevScrollX;
        double scrollFactor = .01;
        double newOffset = (_normalizedOffset + dx * scrollFactor);
        _setOffset(newOffset.clamp(-1.0, 1.0));
      }
      _prevScrollX = notification.metrics.pixels;
    }
    //Scroll Start
    else if (notification is ScrollStartNotification) {
      _isScrolling = true;
      _prevScrollX = notification.metrics.pixels;
      _tweenController.stop();
    }
    return true;
  }

  void _setOffset(double value) {
    setState(() {
      _normalizedOffset = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    Widget listContent = PageView.builder(
      onPageChanged: _onPageChanged,
      controller: _pageController,
      physics: _isDown
          ? const NeverScrollableScrollPhysics()
          : const BouncingScrollPhysics(),
      itemCount: 8,
      scrollDirection: Axis.horizontal,
      itemBuilder: (context, index) {
        return GestureDetector(
            onVerticalDragEnd: (details) => _moveDown(),
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: 280,
                  // 그림 설명 공간
                  child: ValueListenableBuilder(
                      valueListenable: _scroll,
                      builder: (context, scroll, child) {
                        return _buildExplainRenderer(index);
                      }),
                )
                    .animate(
                      target: _isDown ? 1 : 0,
                    )
                    .slideY(
                      end: 1.2,
                      duration: 300.ms,
                      curve: Curves.easeInOutCirc,
                    )
                    .fadeOut(
                      delay: 100.ms,
                      duration: 200.ms,
                    ),
                Positioned(
                  top: 150,
                  child: ValueListenableBuilder(
                      valueListenable: _scroll,
                      builder: (context, scroll, child) {
                        return _buildItemRenderer(index);
                      }),
                )
                    .animate(
                      target: _isDown ? 1 : 0,
                    )
                    .slideY(
                      end: 2.0,
                      duration: 350.ms,
                      curve: Curves.easeInOutCirc,
                    )
                    .fadeOut(
                      delay: 150.ms,
                      duration: 200.ms,
                    ),
              ],
            ));
      },
    );

    return Scaffold(
      backgroundColor: Colors.black87,
      body: Stack(
        children: [
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 500),
            child: Container(
              key: ValueKey(_currentPage),
              decoration: BoxDecoration(
                image: DecorationImage(
                  image:
                      AssetImage("assets/animations/${_currentPage}_all.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: BackdropFilter(
                filter: ImageFilter.blur(
                  sigmaX: 1,
                  sigmaY: 1,
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.7),
                ),
              ),
            ),
          ),
          Positioned(
            top: 50,
            left: widthSize / 2 - 18,
            child: Lottie.asset(
              "assets/animations/down_arrow.json",
              width: 36,
              height: 36,
              repeat: true,
              reverse: true,
              animate: true,
            ),
          )
              .animate(
                target: _isDown ? 1 : 0,
              )
              .rotate(
                end: 0.5,
                duration: 10.ms,
              )
              .slideY(
                end: 18.7,
                duration: 300.ms,
              ),

          Listener(
            onPointerUp: _handlePointerUp,
            child: NotificationListener(
              onNotification: _handleScrollNotifications,
              child: listContent,
            ),
          ),

          Positioned(
            top: 50,
            left: 20,
            child: GestureDetector(
              onTap: () => Navigator.pop(context),
              child: const Row(
                children: [
                  Icon(Icons.arrow_back_ios, color: Colors.white, size: 16),
                  SizedBox(width: 2),
                  Text(
                    "Back",
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: Colors.white),
                  ),
                ],
              )
                  .animate(
                    target: _isDown ? 1 : 0,
                  )
                  .slideX(
                    end: -1,
                    duration: 200.ms,
                  )
                  .fadeOut(
                    duration: 100.ms,
                  ),
            ),
          ),
          // 하단 간략 정보 SnackBar
          Positioned(
            bottom: 0,
            child: GestureDetector(
              onVerticalDragEnd: (details) => _moveUp(),
              child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(6),
                      topRight: Radius.circular(6),
                    ),
                  ),
                  width: widthSize,
                  height: 80,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(24, 6, 16, 18),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 40,
                          height: 52,
                          color: Colors.grey,
                          child: Center(
                            child: Image.asset(
                                "assets/animations/${_currentPage}_all.png",
                                width: 36),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(height: 10),
                            Text(
                              _paintList[_currentPage].title,
                              style: const TextStyle(
                                  fontSize: 16,
                                  letterSpacing: -0.1,
                                  height: 1,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black),
                            ),
                            Text(
                              _paintList[_currentPage].artist,
                              style: const TextStyle(
                                  fontSize: 14,
                                  letterSpacing: -0.1,
                                  fontWeight: FontWeight.w500,
                                  color: Color(0xFF670303)),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )),
            ),
          )
              .animate(
                target: _isDown ? 0 : 1,
              )
              .fade(
                end: 0.0,
                duration: 300.ms,
                curve: Curves.easeInOutQuart,
              )
              .slideY(
                end: 1.0,
                duration: 300.ms,
                curve: Curves.easeInOutQuart,
              ),
          //세부설명 페이지
          Positioned(
            top: 50,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height - 160),
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      SizedBox(
                        width: widthSize - 32,
                        child: _paintList[_currentPage].detail,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
              .animate(
                target: _isDown ? 0 : 1,
              )
              .slideY(
                end: -1.0,
                duration: 300.ms,
                curve: Curves.easeInOutQuart,
              )
              .fadeOut(
                duration: 300.ms,
                curve: Curves.easeInOutQuart,
              ),
        ],
      ),
    );
  }

  //Create a renderer for each list item
  Widget _buildItemRenderer(int itemIndex) {
    return Rotation3d(
      rotationY: _normalizedOffset * _maxRotation,
      //Create the actual content renderer for our list
      child: ImageRenderer(
        key: ValueKey("image_$itemIndex"),
        index: itemIndex,
        offset: _normalizedOffset,
      ),
    );
  }

  Widget _buildExplainRenderer(int itemIndex) {
    return Rotation3d(
      rotationY: _normalizedOffset * _maxRotation,
      //Create the actual content renderer for our list
      child: ExplainRenderer(
        key: ValueKey("explain_$itemIndex"),
        index: itemIndex,
        offset: _normalizedOffset,
        paintList: _paintList,
      ),
    );
  }
}

class ImageRenderer extends StatelessWidget {
  const ImageRenderer({
    Key? key,
    required this.index,
    required this.offset,
  }) : super(key: key);
  final int index;
  final double offset;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 240,
          height: 318,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(18),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.4),
                blurRadius: 10,
                spreadRadius: 3,
                offset: const Offset(3, 6),
              )
            ],
            image: DecorationImage(
              image: AssetImage("assets/animations/$index.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Positioned(child: _buildCharacter()),
      ],
    );
  }

  Widget _buildCharacter() {
    double maxParallax = 30;
    double globalOffset = offset * maxParallax * 2;
    return Container(
      width: 240,
      height: 318,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
      ),
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          _buildPositionedLayer("assets/animations/$index.gif", 240 * .8,
              maxParallax * .1, globalOffset),
        ],
      ),
    );
  }

  Widget _buildPositionedLayer(
      String path, double width, double maxOffset, double globalOffset) {
    return Positioned(
        left: ((200 * .5) - (width / 2) - offset * maxOffset) + globalOffset,
        child: Image.asset(
          path,
          width: 240,
          height: 318,
          fit: BoxFit.cover,
        ));
  }
}

class ExplainRenderer extends StatelessWidget {
  const ExplainRenderer({
    Key? key,
    required this.index,
    required this.offset,
    required this.paintList,
  }) : super(key: key);
  final int index;
  final double offset;
  final List<Paint> paintList;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 340,
        height: 520,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(24),
          color: Colors.white,
        ),
        child: Column(
          children: [
            const SizedBox(height: 220),
            SizedBox(
              width: 300,
              child: Text(
                paintList[index].title,
                textAlign: TextAlign.center,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    height: 1,
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    letterSpacing: -0.8,
                    color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            Text(
              paintList[index].artist,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: Color(0xFF670303)),
            ),
            const SizedBox(height: 2),
            Text(
              paintList[index].year,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w200,
                  color: Color(0xFF7C3131)),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: 300,
              child: Text(
                paintList[index].description,
                overflow: TextOverflow.ellipsis,
                maxLines: 7,
                style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Color(0xFF5E5E5E),
                ),
              ),
            ),
          ],
        ));
  }
}
