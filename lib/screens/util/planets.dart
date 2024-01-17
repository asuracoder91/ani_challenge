enum Planets {
  sun(
    model: 'assets/3ds/Sun.glb',
    name: 'Sun',
  ),
  mercury(
    model: 'assets/3ds/mercury.glb',
    name: 'Mercury',
  ),
  venus(
    model: 'assets/3ds/venus.glb',
    name: 'Venus',
  ),
  earth(
    model: 'assets/3ds/theearth.glb',
    name: 'Earth',
  ),
  mars(
    model: 'assets/3ds/mars.glb',
    name: 'Mars',
  ),
  jupiter(
    model: 'assets/3ds/Jupiter.glb',
    name: 'Jupiter',
  ),
  saturn(
    model: 'assets/3ds/saturn.glb',
    name: 'Saturn',
  ),
  uranus(
    model: 'assets/3ds/uranus.glb',
    name: 'Uranus',
  ),

  neptune(
    model: 'assets/3ds/neptune_flat.glb',
    name: 'Neptune',
  );

  const Planets({
    required this.model,
    required this.name,
  });

  final String model;
  final String name;
}
