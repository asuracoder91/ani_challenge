import 'package:ani_challenge/screens/planet_pages/mars.dart';
import 'package:ani_challenge/screens/planet_pages/mercury.dart';
import 'package:ani_challenge/screens/planet_pages/neptune.dart';
import 'package:ani_challenge/screens/planet_pages/saturn.dart';
import 'package:flutter/material.dart';

enum Planets {
  sun(
    model: 'assets/3ds/Sun.glb',
    name: 'Sun',
    exp:
        'The center of our Solar System, a ma-\nssive star providing light and heat',
    initPos: {'x': 0.0, 'y': 0.0, 'z': 0.26},
    initOrbit: {'theta': 0, 'phi': 75, 'radius': 1.039},
    downPos: {'x': 0.0, 'y': 0.46, 'z': 0.26},
    downOrbit: {'theta': -90, 'phi': 90, 'radius': 0.512},
    initFOV: "30deg",
    downFOV: "30deg",
    detailPage: Mercury(),
  ),
  mercury(
    model: 'assets/3ds/mercury.glb',
    name: 'Mercury',
    exp:
        'Smallest planet, closest to the Sun,\nwith extreme temperature swings',
    initPos: {'x': 1.0, 'y': 0.83, 'z': 0.92},
    initOrbit: {'theta': 0, 'phi': 75, 'radius': 4.057},
    downPos: {'x': 1.0, 'y': 2.64, 'z': 0.92},
    downOrbit: {'theta': -90, 'phi': 90, 'radius': 2.00},
    initFOV: "30deg",
    downFOV: "30deg",
    detailPage: Mercury(),
  ),
  venus(
    model: 'assets/3ds/venus.glb',
    name: 'Venus',
    exp: 'Earth-like but with thick clouds\nand extreme greenhouse effect',
    initPos: {'x': 1.0, 'y': 0.83, 'z': 0.92},
    initOrbit: {'theta': 0, 'phi': 75, 'radius': 4.057},
    downPos: {'x': 1.0, 'y': 2.64, 'z': 0.92},
    downOrbit: {'theta': -90, 'phi': 90, 'radius': 2.00},
    initFOV: "30deg",
    downFOV: "30deg",
    detailPage: Mercury(),
  ),

  earth(
    model: 'assets/3ds/theearth.glb',
    name: 'Earth',
    exp:
        'Only planet known to support life,\nwith blue oceans and diverse climates',
    initPos: {'x': 0.0, 'y': 0.0, 'z': 0.0},
    initOrbit: {'theta': 0, 'phi': 75, 'radius': 0.4979},
    downPos: {'x': 0.0, 'y': 0.22, 'z': 0.0},
    downOrbit: {'theta': -90, 'phi': 90, 'radius': 0.225},
    initFOV: "30deg",
    downFOV: "30deg",
    detailPage: Mercury(),
  ),
  mars(
    model: 'assets/3ds/mars.glb',
    name: 'Mars',
    exp: 'The Red Planet, known for its\nhigh volcano and red surface',
    initPos: {'x': 0.0, 'y': 0.0, 'z': 0.0},
    initOrbit: {'theta': 0, 'phi': 75, 'radius': 10.14},
    downPos: {'x': 0.0, 'y': 4.5, 'z': 0.0},
    downOrbit: {'theta': -90, 'phi': 90, 'radius': 5},
    initFOV: "30deg",
    downFOV: "24deg",
    detailPage: Mars(),
  ),
  jupiter(
    model: 'assets/3ds/Jupiter.glb',
    name: 'Jupiter',
    exp: 'Largest gas giant, famous for\nits Great Red Spot and storms',
    initPos: {'x': 0.0, 'y': 0.0, 'z': 0.26},
    initOrbit: {'theta': 0, 'phi': 75, 'radius': 1.039},
    downPos: {'x': 0.0, 'y': 0.46, 'z': 0.26},
    downOrbit: {'theta': -90, 'phi': 90, 'radius': 0.512},
    initFOV: "30deg",
    downFOV: "30deg",
    detailPage: Mercury(),
  ),
  saturn(
    model: 'assets/3ds/saturn.glb',
    name: 'Saturn',
    exp: 'Gas giant with prominent rings\nof ice and rock',
    initPos: {'x': -0.48, 'y': 0.0, 'z': 3.61},
    initOrbit: {'theta': -34, 'phi': 60, 'radius': 1896},
    downPos: {'x': -0.48, 'y': 466.4, 'z': 3.61},
    downOrbit: {'theta': -90, 'phi': 90, 'radius': 934.9},
    initFOV: "29deg",
    downFOV: "29deg",
    detailPage: Saturn(),
  ),
  uranus(
    model: 'assets/3ds/uranus.glb',
    name: 'Uranus',
    exp: 'Ice giant with a unique tilted\naxis and pale blue color',
    initPos: {'x': 0.01, 'y': 0.12, 'z': 0.26},
    initOrbit: {'theta': 0, 'phi': 151, 'radius': 40580},
    downPos: {'x': 0.01, 'y': 156563, 'z': 0.26},
    downOrbit: {'theta': -90, 'phi': 151, 'radius': 25509},
    initFOV: "30deg",
    downFOV: "30deg",
    detailPage: Mercury(),
  ),

  neptune(
    model: 'assets/3ds/neptune_flat.glb',
    name: 'Neptune',
    exp:
        'Farthest ice giant, known for its\nintense blue color and strong winds',
    initPos: {'x': 1.0, 'y': 0.83, 'z': 0.92},
    initOrbit: {'theta': 0, 'phi': 75, 'radius': 4.057},
    downPos: {'x': 1.0, 'y': 2.64, 'z': 0.92},
    downOrbit: {'theta': -90, 'phi': 90, 'radius': 2.00},
    initFOV: "30deg",
    downFOV: "30deg",
    detailPage: Neptune(),
  );

  const Planets({
    required this.model,
    required this.name,
    required this.exp,
    required this.initPos,
    required this.initOrbit,
    required this.downPos,
    required this.downOrbit,
    required this.initFOV,
    required this.downFOV,
    required this.detailPage,
  });

  final String model;
  final String name;
  final String exp;
  final Map<String, double> initPos;
  final Map<String, double> initOrbit;
  final Map<String, double> downPos;
  final Map<String, double> downOrbit;
  final String initFOV;
  final String downFOV;
  final Widget detailPage;
}
