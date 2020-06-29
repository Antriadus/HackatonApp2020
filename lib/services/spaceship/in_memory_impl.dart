import '../../models/spaceship.dart';
import 'interface.dart';

class SpaceshipServiceInMemoryImpl implements SpaceshipService {
  @override
  Future<List<Spaceship>> getSpaceships() {
    return Future.value([
      Spaceship(
        name: 'Spaceship name',
        description: 'Description',
        price: 34.99,
        info: 'This spaceship is ...',
        image: 'assets/spaceships/1.png',
      ),
      Spaceship(
        name: 'Spaceship name',
        description: 'Description',
        price: 34.99,
        info: 'This spaceship is ...',
        image: 'assets/spaceships/2.png',
      ),
      Spaceship(
        name: 'Spaceship name',
        description: 'Description',
        price: 34.99,
        info: 'This spaceship is ...',
        image: 'assets/spaceships/3.png',
      ),
    ]);
  }
}
