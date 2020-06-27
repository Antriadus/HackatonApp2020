part of 'planet_bloc.dart';

abstract class PlanetEvent extends Equatable {
  const PlanetEvent();

  Stream<PlanetState> applyAsync(PlanetBloc bloc, PlanetState state);

  @override
  List<Object> get props => [];
}

class PlanetInitEvent extends PlanetEvent {
  @override
  Stream<PlanetState> applyAsync(PlanetBloc bloc, PlanetState state) async* {
    try {
      // var planets = await bloc.planetService.getPlanets();
      // yield PlanetDataReceivedState(planets);
    } catch (e) {
      print(e);
    }
  }
}
