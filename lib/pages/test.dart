import 'package:flutter/material.dart';
import 'package:rxdart/subjects.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key key}) : super(key: key);

  @override
  _TestScreenState createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  PageController controller = PageController();
  BehaviorSubject<int> pageSubject = BehaviorSubject<int>.seeded(0);
  BehaviorSubject<Axis> axisSubject =
      BehaviorSubject<Axis>.seeded(Axis.vertical);

  @override
  void initState() {
    super.initState();
    pageSubject.listen((value) {
      controller.animateToPage(value,
          duration: Duration(milliseconds: 500), curve: Curves.linear);
      controller.position.applyViewportDimension(
          (axisSubject.value == Axis.horizontal
              ? MediaQuery.of(context).size.width
              : MediaQuery.of(context).size.height));
    });
  }

  @override
  void dispose() {
    pageSubject.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          pageSubject.add((pageSubject.value ?? 0) + 1);
          axisSubject
              .add(pageSubject.value >= 2 ? Axis.horizontal : Axis.vertical);
        },
      ),
      body: StreamBuilder<Axis>(
          stream: axisSubject,
          builder: (context, snapshot) {
            return PageView(
              physics: NeverScrollableScrollPhysics(),
              scrollDirection: snapshot.data,
              controller: controller,
              children: [
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.red,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.green,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.blue,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.yellow,
                ),
                Container(
                  width: 50,
                  height: 50,
                  color: Colors.purple,
                ),
              ],
            );
          }),
    );
  }
}
