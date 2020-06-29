import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import '../../models/planet.dart';
import '../../services/planet/in_memory_impl.dart';
import '../../services/planet/interface.dart';

part 'planet_event.dart';
part 'planet_state.dart';

class PlanetBloc extends Bloc<PlanetEvent, PlanetState> {
  @override
  PlanetState get initialState => PlanetInitialState();
  final PlanetService planetService = PlanetServiceInMemoryImpl();

  @override
  Stream<PlanetState> mapEventToState(
    PlanetEvent event,
  ) async* {
    yield* event.applyAsync(this, state);
  }
}
