import 'package:flutter/material.dart';

class Mercury extends StatelessWidget {
  const Mercury({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final widthSize = MediaQuery.of(context).size.width;
    return SizedBox(
      width: 512,
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        const Center(
          child: Text(
            "Mercury",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.8,
                color: Colors.white),
          ),
        ),
        const Center(
          child: Text(
            "수성(水星)",
            style: TextStyle(
              color: Colors.yellow,
              fontSize: 18,
            ),
          ),
        ),
        const SizedBox(height: 5),
        const Divider(
          color: Colors.white,
          thickness: 0.5,
        ),
        const SizedBox(height: 10),
        const Text(
          'Mercury is the first planet from the Sun and the smallest in the Solar System. The surface of Mercury is heavily cratered, as a result of countless impact events that have accumulated over billions of years. Its largest crater, Caloris Planitia, has a diameter of 1,550 km (960 mi) and one-third the diameter of the planet (4,880 km or 3,030 mi). Mercury is classified as a terrestrial planet.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Orbit",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
              color: Colors.white70),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Image.asset("assets/images/mercury_01.png",
                width: widthSize / 2 - 24),
            const SizedBox(width: 10),
            Image.asset("assets/images/mercury_02.gif",
                width: widthSize / 2 - 24),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "Mercury has the most eccentric orbit of all the planets in the Solar System; its eccentricity is 0.21 with its distance from the Sun ranging from 46,000,000 to 70,000,000 km (29,000,000 to 43,000,000 mi). It takes 87.969 Earth days to complete an orbit. The diagram illustrates the effects of the eccentricity, showing Mercury's orbit overlaid with a circular orbit having the same semi-major axis",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Mercury's higher velocity when it is near perihelion is clear from the greater distance it covers in each 5-day interval. In the diagram, the varying distance of Mercury to the Sun is represented by the size of the planet, which is inversely proportional to Mercury's distance from the Sun.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Surface geology",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
              color: Colors.white70),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Image.asset("assets/images/mercury_03.jpg", width: 160),
            const SizedBox(width: 10),
            const SizedBox(
              width: 180,
              child: Text(
                "The planet's mantle is chemically heterogeneous, suggesting the planet went through a magma ocean phase early in its history.",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),
        const Text(
          'Crystallization of minerals and convective overturn resulted in a layered, chemically heterogeneous crust with large-scale variations in chemical composition observed on the surface. The crust is low in iron but high in sulfur, resulting from the stronger early chemically reducing conditions than is found on other terrestrial planets. ',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Row(
          children: [
            const SizedBox(
              width: 110,
              child: Text(
                'Mercury was heavily bombarded by comets and asteroids during and shortly',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Image.asset("assets/images/mercury_04.jpg", width: 220),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          'following its formation 4.6 billion years ago, as well as during a possibly separate subsequent episode called the Late Heavy Bombardment that ended 3.8 billion years ago',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
      ]),
    );
  }
}
