import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hack2020/models/planet.dart';
import 'package:hack2020/widgets/planet_carousel_item.dart';
import 'package:rxdart/rxdart.dart';

class PlanetCarousel extends StatefulWidget {
  @override
  _PlanetCarouselState createState() => _PlanetCarouselState();
}

class _PlanetCarouselState extends State<PlanetCarousel> {
  BehaviorSubject<int> currentItemSubject = BehaviorSubject<int>.seeded(1);

  var planets = [
    Planet(
      distanceKilometers: "10 321 23",
      imagePath: "assets/planets/neptune.png",
      name: "Neptune",
    ),
    Planet(
      distanceKilometers: "213 320 299 16",
      imagePath: "assets/planets/venus.png",
      name: "Venus",
    ),
    Planet(
      distanceKilometers: "22 321 316",
      imagePath: "assets/planets/uranus.png",
      name: "Uranus",
    ),
    Planet(
      distanceKilometers: "343 244",
      imagePath: "assets/planets/mercury.png",
      name: "Mercury",
    ),
    Planet(
      distanceKilometers: "1 320 31 16",
      imagePath: "assets/planets/jupiter.png",
      name: "Jupiter",
    ),
    Planet(
      distanceKilometers: "214 214 300",
      imagePath: "assets/planets/mars.png",
      name: "Mars",
    ),
    Planet(
      distanceKilometers: "123 222 332 041",
      imagePath: "assets/planets/moon.png",
      name: "Moon",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Flexible(
              //   child: Container(
              //     // color: Colors.yellow,
              //     child: Text(
              //       "SELECT YOUR DESTINATION",
              //       style: const TextStyle(
              //         fontFamily: 'Futura',
              //         fontWeight: FontWeight.w700,
              //         fontSize: 14.0,
              //       ),
              //     ),
              //   ),
              // ),
              Container(
                height: 180.0,
                child: CarouselSlider(
                  options: CarouselOptions(
                    height: 180.0,
                    aspectRatio: 1.25,
                    enableInfiniteScroll: true,
                    initialPage: 1,
                    onPageChanged: (index, reason) {
                      currentItemSubject.add(index);
                    },
                    viewportFraction: 0.4,
                  ),
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
                ),
              ),
              CurrentPlanetDistance(
                  currentItemSubject: currentItemSubject, planets: planets)
            ],
          ),
        ],
      ),
    );
  }
}

class CurrentPlanetDistance extends StatelessWidget {
  const CurrentPlanetDistance({
    Key key,
    @required this.currentItemSubject,
    @required this.planets,
  }) : super(key: key);

  final BehaviorSubject<int> currentItemSubject;
  final List<Planet> planets;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<int>(
      stream: currentItemSubject,
      initialData: 1,
      builder: (context, snapshot) {
        var currentModel = planets[snapshot.data];
        return Container(
          height: 50,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    currentModel.name.toUpperCase(),
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text(
                    "${currentModel.distanceKilometers} KM",
                    textAlign: TextAlign.left,
                    style: const TextStyle(
                      fontFamily: 'Futura',
                      fontWeight: FontWeight.w700,
                      fontSize: 14.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}