import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:hack2020/pages/home.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

class AnimatedEarthWidget extends StatefulWidget {
  final BehaviorSubject<EarthStates> earthSubject;

  const AnimatedEarthWidget({Key key, this.earthSubject}) : super(key: key);

  @override
  _AnimatedEarthWidgetState createState() => _AnimatedEarthWidgetState();
}

class _AnimatedEarthWidgetState extends State<AnimatedEarthWidget> {
  VideoPlayerController _controller;

  void initState() {
    super.initState();
    widget.earthSubject.listen((value) {
      //because cannot use AnimatedPositioned in StreamBuilder builder
      setState(() {});
    });
    _controller = VideoPlayerController.asset("assets/earth.mp4")
      ..initialize().then((_) {
        setState(() {});
      });
    _controller.play();
    _controller.setLooping(true);
  }

  @override
  Widget build(BuildContext context) {
    var displayHeight = MediaQuery.of(context).size.height;

    var topFactors = {
      EarthStates.full: 0.8,
      EarthStates.half: 1.1,
      EarthStates.hiden: 1.5
    };
    return AnimatedPositioned(
      top: displayHeight * topFactors[widget.earthSubject.value],
      curve: Curves.decelerate,
      duration: Duration(milliseconds: 250),
      child: Container(
        height: 500,
        width: MediaQuery.of(context).size.width,
        child: Transform.scale(
          scale: 2,
          child: VideoPlayer(_controller),
        ),
      ),
    );
    // }
    // );
  }
}
