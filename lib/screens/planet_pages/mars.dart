import 'package:flutter/material.dart';

class Mars extends StatelessWidget {
  const Mars({
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
            "Mars",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.8,
                color: Colors.white),
          ),
        ),
        const Center(
          child: Text(
            "화성(火星)",
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
          'Mars is the fourth planet from the Sun. The surface of Mars is orange-red because it is covered in iron(III) oxide dust, giving it the nickname "the Red Planet". Mars hosts many enormous extinct volcanos (such as Olympus Mons, 21.9 km or 13.6 mi tall) and one of the largest canyons in the Solar System (Valles Marineris, 4,000 km or 2,500 mi long). For comparison, Mars\'s diameter is 6,779 km (4,212 mi). It is classified as a terrestrial planet and is the second smallest of the Solar System\'s planets.',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Physical characteristics",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
              color: Colors.white70),
        ),
        const SizedBox(height: 16),
        Image.asset("assets/images/mars_01.jpg", width: widthSize - 48),
        const SizedBox(height: 10),
        const Text(
          "Mars is approximately half the diameter of Earth, with a surface area only slightly less than the total area of Earth's dry land. Mars is less dense than Earth, having about 15% of Earth's volume and 11% of Earth's mass, resulting in about 38% of Earth's surface gravity.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Mars is a terrestrial planet with a surface that consists of minerals containing silicon and oxygen, metals, and other elements that typically make up rock. The Martian surface is primarily composed of tholeiitic basalt,[55] although parts are more silica-rich ",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        Row(
          children: [
            Image.asset("assets/images/mars_02.jpg", width: 200),
            const SizedBox(width: 10),
            const SizedBox(
              width: 130,
              child: Text(
                "than typical basalt and may be similar to andesitic rocks on Earth, or silica glass.",
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
            Image.asset("assets/images/mars_03.jpg", width: 160),
            const SizedBox(width: 10),
            const SizedBox(
              width: 180,
              child: Text(
                "Mars lost its magnetosphere 4 billion years ago, possibly because of numerous asteroid strikes, so the solar wind interacts directly with the Martian ionosphere",
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
          'he atmosphere of Mars consists of about 96% carbon dioxide, 1.93% argon and 1.89% nitrogen along with traces of oxygen and water. The atmosphere is quite dusty, containing particulates about 1.5 μm in diameter which give the Martian sky a tawny color when seen from the surface. It may take on a pink hue due to iron oxide particles suspended in it. ',
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
                'Of all the planets in the Solar System, the seasons of Mars are the most Earth-',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Image.asset("assets/images/mars_04.jpg", width: 220),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "ike, due to the similar tilts of the two planets' rotational axes. The lengths of the Martian seasons are about twice those of Earth's because Mars's greater distance from the Sun leads to the Martian year being about two Earth years long.",
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
