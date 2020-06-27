import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hack2020/models/planet.dart';
import 'package:rxdart/rxdart.dart';

class AnimatedPlanetsCarouselWidget extends StatelessWidget {
  final BehaviorSubject<bool> arePlanetsShownSubject;

  const AnimatedPlanetsCarouselWidget(
      {Key key, @required this.arePlanetsShownSubject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var displayWidth = MediaQuery.of(context).size.width;
    var displayHeight = MediaQuery.of(context).size.height;
    return StreamBuilder<bool>(
        stream: arePlanetsShownSubject,
        builder: (context, snapshot) {
          var isVisble = snapshot?.data ?? false;
          return AnimatedPositioned(
            curve: Curves.fastOutSlowIn,
            duration: Duration(seconds: 2),
            bottom: isVisble ? displayHeight * 0.5 : 0,
            child: AnimatedOpacity(
              duration: Duration(seconds: 2),
              opacity: isVisble ? 1.0 : 0.0,
              curve: Curves.fastOutSlowIn,
              child: Padding(
                padding: const EdgeInsets.only(top: 45, left: 32),
                child: Container(
                  width: displayWidth,
                  height: 200,
                  child: PlanetCarousel(),
                ),
              ),
            ),
          );
        });
  }
}

class PlanetCarousel extends StatefulWidget {
  PlanetCarousel({Key key}) : super(key: key);

  @override
  _PlanetCarouselState createState() => _PlanetCarouselState();
}

class _PlanetCarouselState extends State<PlanetCarousel> {
  BehaviorSubject<int> currentItemSubject = BehaviorSubject<int>.seeded(1);
  var planets = [
    Planet(
      distanceKilometers: "10 321 23",
      imagePath: "",
      name: "Neptun",
    ),
    Planet(
      distanceKilometers: "213 320 299 16",
      imagePath: "",
      name: "Venus",
    ),
    Planet(
      distanceKilometers: "1 320 31 16",
      imagePath: "",
      name: "Mars",
    ),
    Planet(
      distanceKilometers: "214 214 300",
      imagePath: "",
      name: "Saturn",
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
      options: CarouselOptions(
          height: 400.0,
          enableInfiniteScroll: true,
          initialPage: 1,
          onPageChanged: (index, reason) {
            currentItemSubject.add(index);
          },
          viewportFraction: 0.5),
      items: planets.map((item) {
        return StreamBuilder<int>(
            initialData: 1,
            stream: currentItemSubject,
            builder: (context, snapshot) {
              return PlanetCarouselItem(
                model: item,
                isSelected: item == planets[snapshot.data],
              );
            });
      }).toList(),
    );
  }
}

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
              duration: const Duration(milliseconds: 400),
              height: isSelected ? 200 : 150,
              color: Colors.white10,
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: Text(
                  model.name,
                  style: TextStyle(fontSize: 16.0),
                ),
              ))),
    );
  }
}
