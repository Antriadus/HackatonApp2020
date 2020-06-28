import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:hack2020/models/planet.dart';

class PlanetCarouselItem extends StatefulWidget {
  final Planet model;
  final bool isSelected;

  const PlanetCarouselItem({this.model, this.isSelected});

  @override
  _PlanetCarouselItemState createState() => _PlanetCarouselItemState();
}

class _PlanetCarouselItemState extends State<PlanetCarouselItem> {
  @override
  Widget build(BuildContext context) {
    return Align(
        alignment: Alignment.bottomCenter,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          height: widget.isSelected ? 150 : 120,
          width: widget.isSelected ? 150 : 120,
          child: Center(
            child: ClipRRect(
                borderRadius: BorderRadius.circular(1000),
                child: Container(
                    color: widget.isSelected
                        ? Color.fromARGB(200, 53, 63, 89)
                        : Theme.of(context).scaffoldBackgroundColor,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(1000),
                        child: Image.asset(
                          widget.model.imagePath,
                          fit: BoxFit.fitHeight,
                          height: 600,
                          width: MediaQuery.of(context).size.width,
                        ),
                      ),
                    ))),
          ),
        ));
  }
}
