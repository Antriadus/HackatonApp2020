import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:hack2020/models/planet.dart';
import 'package:hack2020/widgets/planet_carousel_item.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

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
                padding: const EdgeInsets.only(top: 45),
                child: Container(
                  width: displayWidth,
                  height: 400,
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
      distanceKilometers: "22 321 316",
      imagePath: "",
      name: "Uran",
    ),
    Planet(
      distanceKilometers: "343 244",
      imagePath: "",
      name: "Jowisz",
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
    Planet(
      distanceKilometers: "123 222 332 041",
      imagePath: "",
      name: "Neptun",
    ),
    Planet(
      distanceKilometers: "1 320 31 16",
      imagePath: "",
      name: "Mars",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 40.0),
            child: Text(
              "SELECT SPACESHIP",
              style: const TextStyle(
                fontFamily: 'Futura',
                fontWeight: FontWeight.w700,
                fontSize: 14.0,
              ),
            ),
          ),
          Expanded(
            child: Container(
              height: 600.0,
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 400.0,
                  enableInfiniteScroll: true,
                  initialPage: 1,
                  onPageChanged: (index, reason) {
                    currentItemSubject.add(index);
                  },
                  viewportFraction:
                      MediaQuery.of(context).size.width > 800 ? 0.2 : 0.4,
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
          ),
          StreamBuilder<int>(
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
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Text(
                          currentModel.distanceKilometers,
                          textAlign: TextAlign.left,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            },
          )
        ],
      ),
    );
  }
}
