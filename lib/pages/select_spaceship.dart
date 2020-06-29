import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:rxdart/rxdart.dart';

import '../models/spaceship.dart';
import '../services/spaceship/in_memory_impl.dart';
import '../services/spaceship/interface.dart';

class SelectSpaceship extends StatefulWidget {
  final BehaviorSubject<Spaceship> spaceshipSubject;

  const SelectSpaceship({Key key, @required this.spaceshipSubject})
      : super(key: key);
  @override
  _SelectSpaceshipState createState() => _SelectSpaceshipState();
}

class _SelectSpaceshipState extends State<SelectSpaceship>
    with SingleTickerProviderStateMixin {
  SpaceshipService spaceshipService = SpaceshipServiceInMemoryImpl();
  bool moveUp = false;

  @override
  void initState() {
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 100), () {
        setState(() {
          moveUp = !moveUp;
        });
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
        stream: spaceshipService.getSpaceships().asStream(),
        builder: (BuildContext context, AsyncSnapshot<List<Spaceship>> state) {
          if (state.hasData) {
            return CarouselSlider(
              items: state.data.map(buildSpaceshipTile).toList(),
              options: CarouselOptions(
                onPageChanged: (index, _) =>
                    widget.spaceshipSubject.add(state.data[index]),
                aspectRatio: 1,
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        });
  }

  Widget buildSpaceshipTile(Spaceship spaceship) {
    return Stack(
      alignment: Alignment.center,
      children: <Widget>[
        Image.asset('assets/spaceships/spaceship_tile.png'),
        Column(
          children: <Widget>[
            FittedBox(
              fit: BoxFit.scaleDown,
              child: Image.asset(
                spaceship.image,
              ),
            ),
            SizedBox(height: 7.5),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(left: 45),
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        spaceship.name,
                        style: const TextStyle(
                          fontFamily: 'Futura',
                          fontWeight: FontWeight.w700,
                          fontSize: 20.0,
                          color: Color(0XFFD1E2F4),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 7.5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(spaceship.isPositive
                          ? 'assets/positive.png'
                          : 'assets/negative.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        'Hibernate capability',
                        style: const TextStyle(
                          fontFamily: 'Futura',
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Color(0XFFD1E2F4),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('assets/watch.png'),
                      SizedBox(
                        width: 5,
                      ),
                      Text(
                        '${spaceship.days} days',
                        style: const TextStyle(
                          fontFamily: 'Futura',
                          fontWeight: FontWeight.w500,
                          fontSize: 15.0,
                          color: Color(0XFFD1E2F4),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 5),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: <Widget>[
                      Image.asset('assets/seat.png'),
                      SizedBox(
                        width: 5,
                      ),
                      RichText(
                        text: TextSpan(
                            text: '${spaceship.price} Moon Coins',
                            style: const TextStyle(
                              fontFamily: 'Futura',
                              fontWeight: FontWeight.w700,
                              fontSize: 15.0,
                              color: Color(0XFFFF862F),
                            ),
                            children: [
                              TextSpan(
                                text: ' per seat',
                                style: const TextStyle(
                                  fontFamily: 'Futura',
                                  fontWeight: FontWeight.w500,
                                  fontSize: 15.0,
                                  color: Color(0XFFD1E2F4),
                                ),
                              )
                            ]),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
