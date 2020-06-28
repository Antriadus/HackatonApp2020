import '../../models/spaceship.dart';
import 'interface.dart';

class SpaceshipServiceInMemoryImpl implements SpaceshipService {
  @override
  Future<List<Spaceship>> getSpaceships() {
    return Future.value([
      Spaceship(
        name: 'Retro Starship',
        description: 'Description',
        price: 34.99,
        info: 'This spaceship is ...',
        image: 'assets/spaceships/1.png',
      ),
      Spaceship(
        name: 'Intergalactic Tiger',
        description: 'Description',
        price: 34.99,
        info: 'This spaceship is ...',
        image: 'assets/spaceships/2.png',
      ),
      Spaceship(
        name: 'Instans Barrel',
        description: 'Description',
        price: 34.99,
        info: 'This spaceship is ...',
        image: 'assets/spaceships/3.png',
      ),
    ]);
  }
}
