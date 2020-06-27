import 'package:hack2020/models/planet.dart';

abstract class PlanetService {
  Future<List<Planet>> getPlanets();
}
