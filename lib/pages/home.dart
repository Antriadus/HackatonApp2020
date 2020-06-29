import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hack2020/models/planet.dart';
import 'package:hack2020/models/spaceship.dart';
import 'package:hack2020/pages/select_spaceship.dart';
import 'package:hack2020/pages/thank_you.dart';
import 'package:hack2020/pages/your_tickets.dart';
import 'package:hack2020/widgets/animated_app_title.dart';
import 'package:hack2020/widgets/animated_earth.dart';
import 'package:hack2020/widgets/planets_carousel.dart';
import 'package:hack2020/widgets/app_back_button.dart';
import 'package:hack2020/widgets/app_button.dart';
import 'package:rxdart/subjects.dart';

import 'book_seat.dart';
import 'checkout.dart';

enum EarthStates { full, half, hiden }
enum FabStates { pinkOnly, both, none }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final pageSubject = BehaviorSubject<int>.seeded(0);

  final earthStateSubject =
      BehaviorSubject<EarthStates>.seeded(EarthStates.full);

  final fabStateSubject = BehaviorSubject<FabStates>.seeded(FabStates.pinkOnly);
  final selectedSeatsSubject = BehaviorSubject<List<int>>.seeded([]);
  final selectedSpaceshipSubject = BehaviorSubject<Spaceship>.seeded(Spaceship(
    name: 'Spaceship name',
    description: 'Description',
    price: 1000,
    image: 'assets/spaceships/1.png',
  ));

  final selectedPlanetSubject = BehaviorSubject<Planet>.seeded(
    Planet(
      distanceKilometers: "123 222 332 041",
      imagePath: "assets/planets/moon.png",
      name: "Moon",
    ),
  );

  final controller = PageController();

  void animateToPage(int pageNumber) {
    try {
      controller.animateToPage(pageNumber,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    } catch (e) {
      print(e);
    }
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hello'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(
                    'Please check our application using iPhone 8 in device preview.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  void initState() {
    super.initState();
    pageSubject.listen((value) {
      print("page: $value");
      //dealing with hiding and showin earth
      if (value == 0)
        earthStateSubject.add(EarthStates.full);
      else if (value == 1)
        earthStateSubject.add(EarthStates.half);
      else
        earthStateSubject.add(EarthStates.hiden);
      //dealing with fab text and visibility
      if (value == 5) {
        fabStateSubject.add(FabStates.both);
      } else if (value > 5) {
        fabStateSubject.add(FabStates.none);
      } else {
        fabStateSubject.add(FabStates.pinkOnly);
      }
    });
    SchedulerBinding.instance.addPostFrameCallback((timeStamp) async {
      await _showMyDialog();
    });
  }

  @override
  void dispose() {
    selectedPlanetSubject.close();
    earthStateSubject.close();
    pageSubject.close();
    fabStateSubject.close();
    selectedSeatsSubject.close();
    selectedSpaceshipSubject.close();
    super.dispose();
  }

  Widget buildBackButton() {
    return StreamBuilder<int>(
      stream: pageSubject,
      builder: (context, snapshot) {
        var isVisble = snapshot.data != 0 && snapshot.data != 5;
        return AnimatedOpacity(
            //TODO rework animation duration and curve cause it is too slow now
            duration: Duration(seconds: 1),
            opacity: isVisble ? 1.0 : 0.0,
            curve: Curves.fastOutSlowIn,
            child: Padding(
              padding: const EdgeInsets.only(top: 24, left: 12),
              child: AppBackButton(onPressed: () {
                if (snapshot.data == 0) {
                } else {
                  animateToPage(pageSubject.value - 1);
                  pageSubject.add(pageSubject.value - 1);
                }
              }),
            ));
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: buildFab(),
      body: SafeArea(
        child: Stack(
          overflow: Overflow.visible,
          children: [
            AnimatedEarthWidget(earthSubject: earthStateSubject),
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedAppTitleWidget(pageSubject: pageSubject),
            ),
            Align(
                alignment: Alignment.center,
                child: Padding(
                  padding: const EdgeInsets.only(top: 42.0),
                  child: Container(
                      height: MediaQuery.of(context).size.height * 0.5,
                      width: MediaQuery.of(context).size.width,
                      child: buildPageView()),
                )),
            Align(alignment: Alignment.topLeft, child: buildBackButton()),
          ],
        ),
      ),
    );
  }

  Widget buildPageView() {
    var pages = {
      0: buildHomePage(),
      1: buildPlanetsPage(),
      2: buildSpaceshipsPage(),
      3: buildSeatsPage(),
      4: buildCheckoutPage(),
      5: buildThankYouPage(),
      6: buildTicketsPage(),
    };
    return PageView.builder(
      physics: NeverScrollableScrollPhysics(),
      controller: controller,
      itemBuilder: (context, index) {
        return pages[index] ?? Container();
      },
    );
  }

  Widget buildHomePage() {
    return Container();
  }

  Widget buildPlanetsPage() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 64.0),
      child: Stack(
        children: <Widget>[
          PlanetCarousel(
            planetSubject: selectedPlanetSubject,
          ),
          IgnorePointer(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                  gradient: LinearGradient(
                      //stops: [0, 0.1, 0.9, 1],
                      begin: Alignment.centerLeft,
                      end: Alignment.centerRight,
                      colors: [
                    Theme.of(context).scaffoldBackgroundColor,
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                    Theme.of(context).scaffoldBackgroundColor.withOpacity(0),
                    Theme.of(context).scaffoldBackgroundColor
                  ])),
            ),
          )
        ],
      ),
    );
  }

  Widget buildSpaceshipsPage() {
    return SelectSpaceship(
      spaceshipSubject: selectedSpaceshipSubject,
    );
  }

  Widget buildSeatsPage() {
    return BookSeat(
      selectedSeatsSubject: selectedSeatsSubject,
      spaceship: selectedSpaceshipSubject.value,
    );
  }

  Widget buildCheckoutPage() {
    return SingleChildScrollView(
        child: Checkout(
      selectedSeatsSubject: selectedSeatsSubject,
      spaceshipSubject: selectedSpaceshipSubject,
      planetSubject: selectedPlanetSubject,
    ));
  }

  Widget buildThankYouPage() {
    return SingleChildScrollView(child: ThankYou());
  }

  Widget buildTicketsPage() {
    return YourTickets();
  }

  Widget buildQRPage() {
    return Center(
      child: Text("HERE SHOULD BE TICKET DETAILS PAGE WITH QR CODE"),
    );
  }

  Widget buildFab() {
    return StreamBuilder<int>(
      initialData: 0,
      stream: pageSubject,
      builder: (context, snapshot) {
        var titles = {
          0: "START YOUR TRAVEL",
          1: "SELECT SPACESHIP",
          2: "BOOK A SEAT",
          3: "CHECKOUT",
          4: "PAY WITH CHIPSET",
          5: "SEE TICKET"
        };
        var buttonHeight = 72.0;
        return StreamBuilder<FabStates>(
            stream: fabStateSubject,
            builder: (_, fabSubject) {
              if (fabSubject.data == FabStates.pinkOnly) {
                if (snapshot.data == 3) {
                  return StreamBuilder<List<int>>(
                      initialData: [],
                      stream: selectedSeatsSubject,
                      builder: (context, seatsSnapshot) {
                        return Container(
                            height: buttonHeight,
                            child: AppButton(
                              "${seatsSnapshot.data.length} SEATS- CHECK OUT",
                              onTap: () {
                                animateToPage(snapshot.data + 1);
                                pageSubject.add(snapshot.data + 1);
                              },
                            ));
                      });
                }
                return Container(
                  height: buttonHeight,
                  child: AppButton(
                    titles[snapshot.data] ?? "",
                    onTap: () {
                      animateToPage(snapshot.data + 1);
                      pageSubject.add(snapshot.data + 1);
                    },
                  ),
                );
              } else if (fabSubject.data == FabStates.both) {
                return Container(
                  height: (buttonHeight * 2) + 10.0,
                  child: Column(
                    children: [
                      AppButton(
                        titles[snapshot.data] ?? "",
                        onTap: () {
                          animateToPage(snapshot.data + 1);
                          pageSubject.add(snapshot.data + 1);
                        },
                      ),
                      Container(
                        height: 6,
                      ),
                      AppButton(
                        "RETURN HOME",
                        appButtonColor: AppButtonColor.Mono,
                        onTap: () {
                          selectedSeatsSubject.add([]);
                          try {
                            controller.jumpToPage(0);
                          } catch (e) {
                            print(e);
                          }
                          pageSubject.add(0);
                        },
                      )
                    ],
                  ),
                );
              } else {
                return Container();
              }
            });
      },
    );
  }
}
