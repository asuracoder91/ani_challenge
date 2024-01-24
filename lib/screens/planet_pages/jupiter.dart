import 'package:flutter/material.dart';

class Jupiter extends StatelessWidget {
  const Jupiter({
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
            "Jupiter",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.8,
                color: Colors.white),
          ),
        ),
        const Center(
          child: Text(
            "목성(木星)",
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
          "Jupiter is the fifth planet from the Sun and the largest in the Solar System. It is a gas giant with a mass more than two and a half times that of all the other planets in the Solar System combined, and slightly less than one one-thousandth the mass of the Sun. Jupiter orbits the Sun at a distance of 5.20 AU (778.5 Gm) with an orbital period of 11.86 years. Jupiter is the third brightest natural object in the Earth's night sky after the Moon and Venus, and it has been observed since prehistoric times. It was named after Jupiter, the chief deity of ancient Roman religion.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Size and mass",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
              color: Colors.white70),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Image.asset("assets/images/jupiter_01.jpg", width: widthSize / 2),
            const SizedBox(width: 10),
            const SizedBox(
              width: 140,
              child: Text(
                "Jupiter's mass is 318 times that of Earth. 2.5 times that of all the other planets in the Solar System combined. ",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "It is so massive that its barycentre with the Sun lies above the Sun's surface at 1.068 solar radii from the Sun's centre. Jupiter's radius is about one tenth the radius of the Sun, and its mass is one thousandth the mass of the Sun, as the densities of the two bodies are similar",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Atmosphere",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
              color: Colors.white70),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Image.asset("assets/images/jupiter_02.jpg",
                width: widthSize / 2 - 28),
            const SizedBox(width: 10),
            Image.asset("assets/images/jupiter_03.jpg",
                width: widthSize / 2 - 24),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "Jupiter is perpetually covered with clouds of ammonia crystals, which may contain ammonium hydrosulfide as well. The clouds are located in the tropopause layer of the atmosphere, forming bands at different latitudes, known as tropical regions. These are subdivided into lighter-hued zones and darker belts. The interactions of these conflicting circulation patterns cause storms and turbulence",
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
              width: 160,
              child: Text(
                'Wind speeds of 100 metres per second (360 km/h; 220 mph) are common in zonal jet streams. The zones have been observed to vary in width,',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Image.asset("assets/images/jupiter_04.gif", width: 160),
          ],
        ),
        const Text(
          "colour and intensity from year to year, but they have remained stable enough for scientists to name them",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Jupiter has a low axial tilt, thus making it that the poles always receive less solar radiation than the planet's equatorial region. Convection within the interior of the planet transports energy to the poles, balancing out temperatures at the cloud layer.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Orbit and rotation",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
              color: Colors.white70),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Image.asset("assets/images/jupiter_06.gif", width: 220),
            const SizedBox(width: 10),
            const SizedBox(
              width: 110,
              child: Text(
                "Jupiter is the only planet whose barycentre with the Sun lies outside the volume of the Sun,",
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
          "though by only 7% of the Sun's radius. The average distance between Jupiter and the Sun is 778 million km (5.2 AU) and it completes an orbit every 11.86 years. This is approximately two-fifths the orbital period of Saturn, forming a near orbital resonance.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        const SizedBox(height: 10),
        const Text(
          "In 2000, an atmospheric feature formed in the southern hemisphere that is similar in appearance to the Great Red Spot, but smaller. This was created when smaller, white oval-shaped storms merged to form a single feature—these three smaller white ovals were formed in 1939–1940. The merged feature was named Oval BA",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        Image.asset("assets/images/jupiter_07.jpg", width: widthSize - 24),
      ]),
    );
  }
}
