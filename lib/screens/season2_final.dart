import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:o3d/o3d.dart';
import 'package:preload_page_view/preload_page_view.dart';

import 'util/planets.dart';

class StwoFinal extends StatefulWidget {
  const StwoFinal({super.key});

  @override
  State<StwoFinal> createState() => _StwoFinalState();
}

class _StwoFinalState extends State<StwoFinal> {
  O3DController controller = O3DController();
  PreloadPageController pageController =
      PreloadPageController(viewportFraction: 0.96);
  int _currentPage = 0;

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int newPage) {
    setState(() {
      _currentPage = newPage;
    });
  }

  void _setCameraDown() {
    controller.cameraTarget(0, 1.8, 0);
    controller.cameraOrbit(-90, 90, 1.5);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
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
          _buildTitleViewer(Planets.values[_currentPage]),
          PreloadPageView.builder(
              preloadPagesCount: Planets.values.length,
              itemCount: Planets.values.length,
              controller: pageController,
              onPageChanged: _onPageChanged,
              itemBuilder: (BuildContext context, int index) {
                Planets planet = Planets.values[index];
                return _buildModelViewer(planet);
              }),
        ],
      ),
    );
  }

  Widget _buildModelViewer(Planets planet) {
    return AbsorbPointer(
      absorbing: true,
      child: O3D.asset(
        src: planet.model,
        controller: controller,
        autoPlay: true,
        ar: false,
        autoRotate: true,
        autoRotateDelay: 0,
        disablePan: true,
        rotationPerSecond: '20deg',
        interactionPrompt: InteractionPrompt.none,
      ),
    );
  }

  Widget _buildTitleViewer(Planets planet) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
      child: Text(
        planet.name,
        style: TextStyle(
          fontFamily: GoogleFonts.poiretOne().fontFamily,
          fontSize: 82,
          color: Colors.white.withAlpha(180),
        ),
      ),
    );
  }
}
