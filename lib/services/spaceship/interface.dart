import '../../models/spaceship.dart';

abstract class SpaceshipService {
  Future<List<Spaceship>> getSpaceships();
}
