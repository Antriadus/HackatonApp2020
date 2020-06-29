import 'package:hack2020/enums/spaceship_type.dart';

import '../../models/spaceship.dart';
import 'interface.dart';

class SpaceshipServiceInMemoryImpl implements SpaceshipService {
  @override
  Future<List<Spaceship>> getSpaceships() {
    return Future.value([
      Spaceship(
        name: 'Retro Starship',
        description: 'Description',
        price: 1000,
        days: 103,
        type: SpaceshipType.First,
        isPositive: false,
        image: 'assets/spaceships/1.png',
      ),
      Spaceship(
        name: 'Intergalactic Tiger',
        description: 'Description',
        price: 1250,
        days: 96,
        type: SpaceshipType.Oval,
        isPositive: true,
        image: 'assets/spaceships/2.png',
      ),
      Spaceship(
        name: 'Instans Barrel',
        description: 'Description',
        price: 2000,
        type: SpaceshipType.Rocket,
        days: 76,
        isPositive: true,
        image: 'assets/spaceships/3.png',
      ),
    ]);
  }
}
