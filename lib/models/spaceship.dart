import 'package:flutter/foundation.dart';
import 'package:hack2020/enums/spaceship_type.dart';

class Spaceship {
  final String name;
  final SpaceshipType type;
  final String description;
  final double price;
  final String info;
  final String image;
  final int seatsCount;

  Spaceship(
      {this.name,
      this.type,
      this.description,
      this.price,
      this.info,
      this.image,
      @required this.seatsCount});
}
