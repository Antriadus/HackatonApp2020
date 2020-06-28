import 'package:flutter/material.dart';
import 'package:hack2020/pages/select_spaceship.dart';
import 'package:hack2020/widgets/animated_app_title.dart';
import 'package:hack2020/widgets/animated_earth.dart';
import 'package:hack2020/widgets/animeted_planets_carousel.dart';
import 'package:hack2020/widgets/app_back_button.dart';
import 'package:hack2020/widgets/app_button.dart';
import 'package:rxdart/subjects.dart';

enum earthStates { full, half, hiden }

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  BehaviorSubject<bool> arePlanetsShownSubject =
      BehaviorSubject<bool>.seeded(false);
  BehaviorSubject<int> pageSubject = BehaviorSubject<int>.seeded(0);
  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
    // pageSubject.listen((value) async {
    //   if (value == null) return;
    //   await controller.animateToPage(value,
    //       duration: Duration(milliseconds: 500), curve: Curves.linear);
    //   // controller.position.applyViewportDimension(
    //   //     (axisSubject.value == Axis.horizontal
    //   //         ? MediaQuery.of(context).size.width
    //   //         : MediaQuery.of(context).size.height));
    // });
  }

  @override
  void dispose() {
    arePlanetsShownSubject.close();
    pageSubject.close();
    super.dispose();
  }

  Widget buildBackButton() {
    return StreamBuilder<bool>(
      initialData: false,
      stream: arePlanetsShownSubject,
      builder: (context, planetsVisibleSnapshot) {
        var isVisble = planetsVisibleSnapshot?.data ?? false;
        return AnimatedOpacity(
            duration: Duration(seconds: 2),
            opacity: isVisble ? 1.0 : 0.0,
            curve: Curves.fastOutSlowIn,
            child: Padding(
              padding: const EdgeInsets.only(top: 45, left: 32),
              child: AppBackButton(onPressed: () {
                if (pageSubject.value == 0) {
                  if (arePlanetsShownSubject.value) {
                    arePlanetsShownSubject.add(false);
                  } else {}
                } else {
                  controller.animateToPage(pageSubject.value - 1,
                      duration: Duration(milliseconds: 500),
                      curve: Curves.linear);
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
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: buildFab(),
      body: Stack(
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: AnimatedAppTitleWidget(
                arePlanetsShownSubject: arePlanetsShownSubject),
          ),
          Align(
              alignment: Alignment.center,
              child: PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                controller: controller,
                itemBuilder: (context, index) {
                  if (index == 0) {
                    return buildPage1();
                  } else if (index == 1) {
                    return buildPage2();
                  } else if (index == 3) {
                    return buildPage3();
                  }
                  return Container();
                },
              )),
          Align(alignment: Alignment.topLeft, child: buildBackButton()),
        ],
      ),
    );
  }

  Widget buildPage1() {
    return Stack(children: [
      AnimatedPlanetsCarouselWidget(
          arePlanetsShownSubject: arePlanetsShownSubject),
      AnimatedEarthWidget(arePlanetsShownSubject: arePlanetsShownSubject),
    ]);
  }

  Widget buildPage2() {
    return SelectSpaceship();
  }

  Widget buildPage3() {
    return Container(
      width: 50,
      height: 50,
      color: Colors.green,
    );
  }

  Container buildFab() {
    return Container(
        height: 54,
        child: StreamBuilder<bool>(
          stream: arePlanetsShownSubject,
          initialData: false,
          builder: (context, planetsSnapshot) {
            return StreamBuilder<int>(
              initialData: 0,
              stream: pageSubject,
              builder: (context, snapshot) {
                var title = "";
                void Function() onClick;
                if (snapshot.data == 0) {
                  if (planetsSnapshot.data) {
                    onClick = () {
                      pageSubject.add(1);
                      controller.animateToPage(1,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.linear);
                    };
                  } else {
                    onClick = () => arePlanetsShownSubject.add(true);
                  }
                } else {
                  onClick = () {
                    controller.animateToPage(snapshot.data + 1,
                        duration: Duration(milliseconds: 500),
                        curve: Curves.linear);
                    pageSubject.add(snapshot.data + 1);
                  };
                }
                if (snapshot.data == 0) {
                  title = planetsSnapshot.data
                      ? "SELECT SPACESHIP"
                      : "START YOUR TRAVEL";
                } else if (snapshot.data == 1) {
                  title = "BOOK A SEAT";
                } else if (snapshot.data == 2) {
                  title = "CHECKOUT";
                } else if (snapshot.data == 3) {
                  title = "PAY WITH CHIPSET";
                }

                return AppButton(
                  title,
                  onTap: () {
                    onClick();
                  },
                );
              },
            );
          },
        ));
  }
}
