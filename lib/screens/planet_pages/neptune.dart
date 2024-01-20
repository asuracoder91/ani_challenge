import 'package:flutter/material.dart';

class Neptune extends StatelessWidget {
  const Neptune({
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
            "Neptune",
            style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.w700,
                letterSpacing: -0.8,
                color: Colors.white),
          ),
        ),
        const Center(
          child: Text(
            "해왕성(海王星)",
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
          'Neptune is the eighth and farthest planet from the Sun. It is the fourth-largest planet in the Solar System by diameter, the third-most-massive planet, and the densest giant planet. It is 17 times the mass of Earth, and slightly more massive than its near-twin Uranus',
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Climate",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
              color: Colors.white70),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Image.asset("assets/images/neptune_01.jpg",
                width: widthSize / 2 - 24),
            const SizedBox(width: 10),
            Image.asset("assets/images/neptune_02.jpg",
                width: widthSize / 2 - 24),
          ],
        ),
        const SizedBox(height: 10),
        const Text(
          "Neptune's weather is characterised by extremely dynamic storm systems, with winds reaching speeds of almost 600 m/s (2,200 km/h; 1,300 mph)—exceeding supersonic flow. More typically, by tracking the motion of persistent clouds, wind speeds have been shown to vary from 20 m/s in the easterly direction to 325 m/s westward.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Planetary rings",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
              color: Colors.white70),
        ),
        Row(
          children: [
            Image.asset("assets/images/neptune_04.png", width: 200),
            const SizedBox(width: 10),
            const SizedBox(
              width: 140,
              child: Text(
                "Neptune has a planetary ring system, though one much less substantial than that of Saturn.",
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
          "The rings may consist of ice particles coated with silicates or carbon-based material, which most likely gives them a reddish hue. The three main rings are the narrow Adams Ring, 63,000 km from the centre of Neptune, the Le Verrier Ring, at 53,000 km, and the broader, fainter Galle Ring, at 42,000 km. A faint outward extension to the Le Verrier Ring has been named Lassell; it is bounded at its outer edge by the Arago Ring at 57,000 km",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          "Exploration",
          style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.w700,
              letterSpacing: -0.8,
              color: Colors.white70),
        ),
        const SizedBox(height: 16),
        Row(
          children: [
            Image.asset("assets/images/neptune_06.gif", width: 260),
            const SizedBox(width: 10),
            const SizedBox(
              width: 80,
              child: Text(
                "Voyager 2 is the only spacecraft that has visited Neptune.",
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
          "The spacecraft's closest approach to the planet occurred on 25 August 1989. Because this was the last major planet the spacecraft could visit, it was decided to make a close flyby of the moon Triton, regardless of the consequences to the trajectory, similarly to what was done for Voyager 1's encounter with Saturn and its moon Titan.",
          style: TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w400,
          ),
        ),
      ]),
    );
  }
}
