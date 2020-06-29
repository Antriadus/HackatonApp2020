import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class Planet extends Equatable {
  final String name;
  final String imagePath;
  final String distanceKilometers;

  ///Space separated thousands

  Planet({
    @required this.name,
    @required this.imagePath,
    @required this.distanceKilometers,
  });

  @override
  List<Object> get props => [name, distanceKilometers];
}
