import 'package:hack2020/models/planet.dart';
import 'package:hack2020/services/planet/interface.dart';

class PlanetServiceInMemoryImpl implements PlanetService {
  @override
  Future<List<Planet>> getPlanets() {
    return Future.value([
      Planet(
        name: "Sun",
        modelPath: 'assets/earth/4096_earth.jpg',
        radius: 10,
      ),
      Planet(
          name: "Earth", modelPath: 'assets/earth/4096_earth.jpg', radius: 10),
      Planet(
        name: "Mars",
        modelPath: 'assets/earth/4096_earth.jpg',
        radius: 7,
      ),
      Planet(
        name: "Venus",
        modelPath: 'assets/earth/4096_earth.jpg',
        radius: 20,
      )
    ]);
  }
}
