import 'package:flutter/material.dart';
import 'package:o3d/o3d.dart';

class StwoFinal extends StatefulWidget {
  const StwoFinal({super.key});

  @override
  State<StwoFinal> createState() => _StwoFinalState();
}

class _StwoFinalState extends State<StwoFinal> {
  O3DController controller = O3DController();
  PageController pageController = PageController(viewportFraction: 0.96);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF100F13),
      appBar: AppBar(
        backgroundColor: const Color(0xFF100F13),
        actions: [
          IconButton(
            onPressed: () {
              // 다음 페이지로 이동
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            icon: const Icon(Icons.arrow_forward),
          ),
          IconButton(
            onPressed: () {
              // 이전 페이지로 이동
              pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            },
            icon: const Icon(Icons.arrow_back),
          ),
        ],
      ),
      body: GestureDetector(
        onHorizontalDragUpdate: (details) {
          // null 체크 추가
          if (details.primaryDelta != null) {
            if (details.primaryDelta! < 0) {
              pageController.nextPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            } else if (details.primaryDelta! > 0) {
              pageController.previousPage(
                duration: const Duration(milliseconds: 300),
                curve: Curves.easeInOut,
              );
            }
          }
        },
        child: PageView(
          controller: pageController,
          children: <Widget>[
            _buildModelViewer('assets/3ds/Sun.glb'),
            _buildModelViewer('assets/3ds/mercury.glb'),
            _buildModelViewer('assets/3ds/venus.glb'),
            _buildModelViewer('assets/3ds/theearth.glb'),
            _buildModelViewer('assets/3ds/moon.glb'),
            _buildModelViewer('assets/3ds/mars.glb'),
            _buildModelViewer('assets/3ds/Jupiter.glb'),
            _buildModelViewer('assets/3ds/saturn.glb'),
            _buildModelViewer('assets/3ds/uranus.glb'),
            _buildModelViewer('assets/3ds/neptune.glb'),
          ],
        ),
      ),
    );
  }

  Widget _buildModelViewer(String modelPath) {
    return AbsorbPointer(
      absorbing: true,
      child: O3D.asset(
        src: modelPath,
        controller: controller,
        autoPlay: true,
        autoRotate: true,
        autoRotateDelay: 0,
        disablePan: true,
        rotationPerSecond: 'auto',
        interactionPrompt: InteractionPrompt.none,
      ),
    );
  }
}
