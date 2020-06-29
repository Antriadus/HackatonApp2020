import 'package:flutter/foundation.dart';
import 'package:hack2020/enums/spaceship_type.dart';

class Spaceship {
  final String name;
  final SpaceshipType type;
  final String description;
  final int price;
  final int days;
  final bool isPositive;
  final String image;

  Spaceship(
      {this.name,
      this.type,
      this.description,
      this.price,
      this.days,
      this.isPositive,
      this.image,
     });
}
