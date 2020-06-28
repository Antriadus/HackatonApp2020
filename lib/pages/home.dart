import 'package:flutter/material.dart';
import 'package:hack2020/pages/select_spaceship.dart';
import 'package:hack2020/widgets/animated_app_title.dart';
import 'package:hack2020/widgets/animated_earth.dart';
import 'package:hack2020/widgets/planets_carousel.dart';
import 'package:hack2020/widgets/app_back_button.dart';
import 'package:hack2020/widgets/app_button.dart';
import 'package:rxdart/subjects.dart';

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

  final controller = PageController();

  void animateToPage(int pageNumber) {
    try {
      controller.animateToPage(pageNumber,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
    } catch (e) {
      print(e);
    }
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
  }

  @override
  void dispose() {
    earthStateSubject.close();
    pageSubject.close();
    fabStateSubject.close();
    super.dispose();
  }

  Widget buildBackButton() {
    return StreamBuilder<int>(
      stream: pageSubject,
      builder: (context, snapshot) {
        var isVisble = snapshot.data != 0;
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
      6: buildQRPage(),
      // 7: buildQRPage(),
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
    return PlanetCarousel();
  }

  Widget buildSpaceshipsPage() {
    return SelectSpaceship();
  }

  Widget buildSeatsPage() {
    return Center(
      child: Container(
        child: Text("HERE SHOULD BE CHOOSE SEATS PAGE"),
      ),
    );
  }

  Widget buildCheckoutPage() {
    return Center(
      child: Text("HERE SHOULD BE CHECKOUT PAGE"),
    );
  }

  Widget buildThankYouPage() {
    return Center(
      child: Text("HERE SHOULD BE THANK YOU PAGE"),
    );
  }

  Widget buildTicketsPage() {
    return Center(
      child: Text("HERE SHOULD BE YOUR TICKETS PAGE"),
    );
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
                        onTap: () {
                          animateToPage(0);
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
