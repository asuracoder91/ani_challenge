import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:o3d/o3d.dart';
import 'package:preload_page_view/preload_page_view.dart';
import 'package:typethis/typethis.dart';

import 'util/planets.dart';

class StwoFinal extends StatefulWidget {
  const StwoFinal({super.key});

  @override
  State<StwoFinal> createState() => _StwoFinalState();
}

class _StwoFinalState extends State<StwoFinal> {
  O3DController controller = O3DController();
  PreloadPageController pageController =
      PreloadPageController(viewportFraction: 0.99);
  PreloadPageController delayedPageController =
      PreloadPageController(viewportFraction: 0.99);
  PreloadPageController delayedExpPageController =
      PreloadPageController(viewportFraction: 0.99);
  final ScrollController _scrollController = ScrollController();
  int _currentPage = 0;
  bool _isDown = false;

  final ValueNotifier<double> _scroll = ValueNotifier<double>(0.0);

  Map<Planets, O3DController> controllers = {};

  @override
  void dispose() {
    _scrollController.dispose();
    pageController.dispose();
    delayedPageController.dispose();
    delayedExpPageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
    delayedPageController.animateToPage(
      newPage,
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeInOut,
    );
    delayedExpPageController.animateToPage(
      newPage,
      duration: const Duration(milliseconds: 100),
      curve: Curves.linear,
    );
  }

  void _setCameraDown() {
    var currentController = controllers[Planets.values[_currentPage]];
    if (currentController != null) {
      currentController.cameraTarget(
        Planets.values[_currentPage].downPos['x']!,
        Planets.values[_currentPage].downPos['y']!,
        Planets.values[_currentPage].downPos['z']!,
      );
      currentController.cameraOrbit(
        Planets.values[_currentPage].downOrbit['theta']!,
        Planets.values[_currentPage].downOrbit['phi']!,
        Planets.values[_currentPage].downOrbit['radius']!,
      );
    }
  }

  void _setCameraBack() {
    var currentController = controllers[Planets.values[_currentPage]];
    if (currentController != null) {
      currentController.cameraTarget(
        Planets.values[_currentPage].initPos['x']!,
        Planets.values[_currentPage].initPos['y']!,
        Planets.values[_currentPage].initPos['z']!,
      );
      currentController.cameraOrbit(
        Planets.values[_currentPage].initOrbit['theta']!,
        Planets.values[_currentPage].initOrbit['phi']!,
        Planets.values[_currentPage].initOrbit['radius']!,
      );
    }
  }

  void _moveDown() {
    setState(() {
      _scrollController.jumpTo(0);
      _isDown = true;
    });
  }

  void _moveUp() {
    setState(() {
      _isDown = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    final heightSize = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragUpdate: (details) {
          if (details.delta.dy > 0) {
            _setCameraDown();
            _moveDown();
          } else {
            _setCameraBack();
            _moveUp();
          }
        },
        child: Stack(
          children: [
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 500),
              child: Container(
                key: ValueKey(_currentPage),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/3ds/$_currentPage.jpg"),
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
            PreloadPageView.builder(
              preloadPagesCount: Planets.values.length,
              itemCount: Planets.values.length,
              controller: delayedPageController,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return _buildTitleViewer(Planets.values[index]);
              },
              physics: _isDown
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
            ),
            PreloadPageView.builder(
              preloadPagesCount: Planets.values.length,
              itemCount: Planets.values.length,
              controller: delayedExpPageController,
              onPageChanged: _onPageChanged,
              itemBuilder: (context, index) {
                return _buildExplanationViewer(Planets.values[index]);
              },
              physics: _isDown
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
            ),
            PreloadPageView.builder(
              preloadPagesCount: Planets.values.length,
              itemCount: Planets.values.length,
              controller: pageController,
              onPageChanged: _onPageChanged,
              itemBuilder: (BuildContext context, int index) {
                Planets planet = Planets.values[index];
                return _buildModelViewer(planet);
              },
              physics: _isDown
                  ? const NeverScrollableScrollPhysics()
                  : const AlwaysScrollableScrollPhysics(),
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
                  end: 15.7,
                  duration: 300.ms,
                ),
            Positioned(
              top: 50,
              child: ShaderMask(
                shaderCallback: (Rect bounds) {
                  return const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [Colors.transparent, Colors.black],
                    stops: [0.9, 1.0],
                  ).createShader(bounds);
                },
                blendMode: BlendMode.dstOut,
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxHeight: heightSize - 270),
                  child: SingleChildScrollView(
                    controller: _scrollController,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          SizedBox(
                            width: widthSize - 32,
                            child: Planets.values[_currentPage].detailPage,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            )
                .animate(
                  target: _isDown ? 0 : 1,
                )
                .fadeOut(
                  duration: 300.ms,
                  curve: Curves.easeInOutQuart,
                )
                .slideY(
                  end: -1.0,
                  duration: 300.ms,
                  curve: Curves.easeInOutQuart,
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildModelViewer(Planets planet) {
    controllers.putIfAbsent(planet, () => O3DController());

    return AbsorbPointer(
      absorbing: true,
      child: O3D.asset(
        src: planet.model,
        controller: controllers[planet],
        autoPlay: true,
        ar: false,
        autoRotate: true,
        autoRotateDelay: 0,
        disablePan: true,
        rotationPerSecond: '15deg',
        interactionPrompt: InteractionPrompt.none,
        cameraTarget: CameraTarget(
          planet.initPos['x']!,
          planet.initPos['y']!,
          planet.initPos['z']!,
        ),
        cameraOrbit: CameraOrbit(
          planet.initOrbit['theta']!,
          planet.initOrbit['phi']!,
          planet.initOrbit['radius']!,
        ),
        fieldOfView: planet.initFOV,
      ),
    );
  }

  Widget _buildTitleViewer(Planets planet) {
    return Padding(
      key: ValueKey(_isDown),
      padding: const EdgeInsets.fromLTRB(24, 96, 24, 0),
      child: Text(
        planet.name,
        style: TextStyle(
          fontFamily: GoogleFonts.poiretOne().fontFamily,
          fontSize: 62,
          color: Colors.white.withAlpha(180),
        ),
      ),
    )
        .animate(
          target: _isDown ? 1 : 0,
        )
        .slideY(
          end: 1.1,
          duration: 300.ms,
        );
  }

  Widget _buildExplanationViewer(Planets planet) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 120),
        child: TypeThis(
          key: ValueKey(_isDown),
          string: planet.exp,
          speed: 20,
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w400,
              color:
                  _isDown ? Colors.transparent : Colors.white.withAlpha(240)),
        ),
      ),
    );
  }
}
