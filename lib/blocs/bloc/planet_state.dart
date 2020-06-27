part of 'planet_bloc.dart';

abstract class PlanetState extends Equatable {
  const PlanetState();
  @override
  List<Object> get props => [];
}

class PlanetInitialState extends PlanetState {}

class PlanetDataReceivedState extends PlanetState {
  final List<Planet> data;
  PlanetDataReceivedState(this.data);
}
