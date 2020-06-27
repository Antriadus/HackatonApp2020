import 'package:flutter/widgets.dart';
import 'package:hack2020/models/planet.dart';

class PlanetCarouselItem extends StatelessWidget {
  final Planet model;
  final bool isSelected;

  const PlanetCarouselItem({this.model, this.isSelected});
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              height: isSelected ? 150 : 120,
              width: isSelected ? 150 : 120,
              child: Center(
                  child: Image.asset(
                "assets/earth.jpg",
                fit: BoxFit.fitHeight,
                height: 600,
                width: MediaQuery.of(context).size.width,
              )))),
    );
  }
}
