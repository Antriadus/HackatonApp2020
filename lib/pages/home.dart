import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hack2020/blocs/bloc/planet_bloc.dart';
import 'package:hack2020/widgets/space_map.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PlanetBloc()..add(PlanetInitEvent()),
      child: HomeScreenScaffold(widget: widget),
    );
  }
}

class HomeScreenScaffold extends StatelessWidget {
  const HomeScreenScaffold({
    Key key,
    @required this.widget,
  }) : super(key: key);

  final HomePage widget;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PlanetBloc, PlanetState>(
        builder: (context, state) {
          if (state is PlanetDataReceivedState) {
            return SpaceMap(state.data);
          }
          return SpaceMap([]);
        },
      ),
    );
  }
}
