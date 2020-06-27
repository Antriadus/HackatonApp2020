import 'package:flutter/foundation.dart';

class PlanetPosition {
  final double x;
  final double y;
  final double z;

  PlanetPosition({
    //I think those two values shold be enough because it will be 2D map. If I'm wrong, please refactor.
    @required this.x,
    @required this.y,
    @required this.z,
  });
}
