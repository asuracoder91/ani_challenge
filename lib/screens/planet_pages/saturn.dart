import 'package:flutter/material.dart';

class Saturn extends StatelessWidget {
  const Saturn({
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
            "Saturn",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.8,
                color: Colors.white),
          ),
        ),
        const Center(
          child: Text(
            "토성(土星)",
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
          'Saturn is the sixth planet from the Sun and the second-largest in the Solar System, after Jupiter. It is a gas giant with an average radius of about nine-and-a-half times that of Earth. It has only one-eighth the average density of Earth, but is over 95 times more massive.',
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
            Image.asset("assets/images/saturn_01.jpg",
                width: widthSize / 2 - 28),
            const SizedBox(width: 10),
            Image.asset("assets/images/saturn_02.gif",
                width: widthSize / 2 - 24),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "A persisting hexagonal wave pattern around the north polar vortex in the atmosphere at about 78°N was first noted in the Voyager images. The sides of the hexagon are each about 14,500 km (9,000 mi) long, which is longer than the diameter of the Earth.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 10),
        const Text(
          "Saturn has an intrinsic magnetic field that has a simple, symmetric shape—a magnetic dipole. Its strength at the equator—0.2 gauss (µT)—is approximately one twentieth of that of the field around Jupiter and slightly weaker than Earth's magnetic field.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        Row(
          children: [
            Image.asset("assets/images/saturn_03.jpg", width: widthSize / 2),
            const SizedBox(width: 10),
            const SizedBox(
              width: 140,
              child: Text(
                "As a result, Saturn's magnetosphere is much smaller than Jupiter's.",
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
          "When Voyager 2 entered the magnetosphere, the solar wind pressure was high and the magnetosphere extended only 19 Saturn radii, or 1.1 million km (712,000 mi)",
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
            Image.asset("assets/images/saturn_04.gif", width: 220),
            const SizedBox(width: 10),
            const SizedBox(
              width: 110,
              child: Text(
                "The average distance between Saturn and the Sun is over 1.4 billion kilometers (9 AU). ",
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
          'With an average orbital speed of 9.68 km/s. it takes Saturn 10,759 Earth days (or about 29+1⁄2 years) to finish one revolution around the Sun. As a consequence, it forms a near 5:2 mean-motion resonance with Jupiter. The elliptical orbit of Saturn is inclined 2.48° relative to the orbital plane of the Earth. This is Simulated',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const SizedBox(
              width: 160,
              child: Text(
                ' appearance of Saturn as seen from Earth (at opposition) during an orbit of Saturn, 2001–2029',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Image.asset("assets/images/saturn_05.gif", width: 160),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "In March 2007, it was found that the variation in radio emissions from the planet did not match Saturn's rotation rate. This variance may be caused by geyser activity on Saturn's moon Enceladus. The water vapor emitted into Saturn's orbit by this activity becomes charged and creates a drag upon Saturn's magnetic field, slowing its rotation slightly relative to the rotation of the planet",
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
