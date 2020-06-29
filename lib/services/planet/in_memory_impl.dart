import 'package:hack2020/models/planet.dart';
import 'package:hack2020/services/planet/interface.dart';

class PlanetServiceInMemoryImpl implements PlanetService {
  @override
  Future<List<Planet>> getPlanets() {
    return Future.value([
      Planet(
        distanceKilometers: "10 321 23",
        imagePath: "",
        name: "Neptun",
      ),
      Planet(
        distanceKilometers: "213 320 299 16",
        imagePath: "",
        name: "Venus",
      ),
      Planet(
        distanceKilometers: "22 321 316",
        imagePath: "",
        name: "Uran",
      ),
      Planet(
        distanceKilometers: "343 244",
        imagePath: "",
        name: "Jowisz",
      ),
      Planet(
        distanceKilometers: "1 320 31 16",
        imagePath: "",
        name: "Mars",
      ),
      Planet(
        distanceKilometers: "214 214 300",
        imagePath: "",
        name: "Saturn",
      ),
      Planet(
        distanceKilometers: "123 222 332 041",
        imagePath: "",
        name: "Neptun",
      ),
      Planet(
        distanceKilometers: "1 320 31 16",
        imagePath: "",
        name: "Mars",
      ),
    ]);
  }
}
