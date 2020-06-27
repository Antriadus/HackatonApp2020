import 'package:flutter/foundation.dart';
import 'package:hack2020/models/planet_position.dart';

class Planet {
  final String name;
  final String modelPath;
  final PlanetPosition positon;
  final double radius;

  Planet({
    @required this.name,
    @required this.modelPath,
    @required this.radius,
    @required this.positon,
  });
}
