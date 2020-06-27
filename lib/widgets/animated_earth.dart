import 'package:flutter/material.dart';
import 'package:rxdart/rxdart.dart';
import 'package:video_player/video_player.dart';

class AnimatedEarthWidget extends StatefulWidget {
  final BehaviorSubject<bool> arePlanetsShownSubject;

  const AnimatedEarthWidget({Key key, this.arePlanetsShownSubject})
      : super(key: key);

  @override
  _AnimatedEarthWidgetState createState() => _AnimatedEarthWidgetState();
}

class _AnimatedEarthWidgetState extends State<AnimatedEarthWidget> {
  VideoPlayerController _controller;

  void initState() {
    super.initState();
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
    return StreamBuilder<bool>(
        stream: widget.arePlanetsShownSubject,
        builder: (context, snapshot) {
          return StreamBuilder<bool>(
              stream: widget.arePlanetsShownSubject,
              builder: (context, snapshot) {
                var isOnBottom = snapshot?.data ?? false;
                return AnimatedPositioned(
                    top: isOnBottom ? displayHeight * 0.7 : displayHeight * 0.4,
                    curve: Curves.fastOutSlowIn,
                    duration: Duration(seconds: 2),
                    child: Container(
                        height: 600,
                        width: MediaQuery.of(context).size.width,
                        child: VideoPlayer(_controller)));
              });
        });
  }
}
