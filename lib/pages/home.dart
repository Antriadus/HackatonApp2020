import 'package:flutter/material.dart';
import 'package:hack2020/pages/select_spaceship.dart';
import 'package:hack2020/widgets/animated_app_title.dart';
import 'package:hack2020/widgets/animated_earth.dart';
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
  BehaviorSubject<int> pageSubject = BehaviorSubject<int>.seeded(0);
  BehaviorSubject<EarthStates> earthStateSubject =
      BehaviorSubject<EarthStates>.seeded(EarthStates.full);
  BehaviorSubject<FabStates> fabStateSubject =
      BehaviorSubject<FabStates>.seeded(FabStates.pinkOnly);
  PageController controller = PageController();

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
      if (value == 0)
        earthStateSubject.add(EarthStates.full);
      else if (value == 1)
        earthStateSubject.add(EarthStates.half);
      else
        earthStateSubject.add(EarthStates.hiden);

      if (value == 5) {
        fabStateSubject.add(FabStates.both);
      } else if (value > 5) {
        fabStateSubject.add(FabStates.none);
      } else {
        fabStateSubject.add(FabStates.pinkOnly);
      }
    });
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
            duration: Duration(seconds: 2),
            opacity: isVisble ? 1.0 : 0.0,
            curve: Curves.fastOutSlowIn,
            child: Padding(
              padding: const EdgeInsets.only(top: 45, left: 32),
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
      backgroundColor: Colors.black,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: buildFab(),
      body: SafeArea(
        child: Stack(
          children: [
            AnimatedEarthWidget(earthSubject: earthStateSubject),
            Align(
              alignment: Alignment.topCenter,
              child: AnimatedAppTitleWidget(pageSubject: pageSubject),
            ),
            // Align(
            //     alignment: Alignment.center,
            //     child: PageView.builder(
            //       physics: NeverScrollableScrollPhysics(),
            //       controller: controller,
            //       itemBuilder: (context, index) {
            //         if (index == 0) {
            //           return buildPage1();
            //         } else if (index == 1) {
            //           return buildPage2();
            //         } else if (index == 3) {
            //           return buildPage3();
            //         }
            //         return Container();
            //       },
            //     )),
            Align(alignment: Alignment.topLeft, child: buildBackButton()),
          ],
        ),
      ),
    );
  }

  Widget buildPage0() {
    return Container();
  }

  Widget buildPage1() {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
    );
    // return AnimatedPlanetsCarouselWidget(
    //     arePlanetsShownSubject: arePlanetsShownSubject);
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
        return StreamBuilder<FabStates>(
            stream: fabStateSubject,
            builder: (_, fabSubject) {
              if (fabSubject.data == FabStates.pinkOnly) {
                return Container(
                  height: 54,
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
                  height: (54 * 2) + 10.0,
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
                        height: 10,
                      ),
                      AppButton(
                        titles[snapshot.data] ?? "",
                        onTap: () {
                          animateToPage(snapshot.data + 1);
                          pageSubject.add(snapshot.data + 1);
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
