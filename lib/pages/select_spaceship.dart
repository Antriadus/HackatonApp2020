import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../models/spaceship.dart';
import '../services/spaceship/in_memory_impl.dart';
import '../services/spaceship/interface.dart';
import '../widgets/app_back_button.dart';
import '../widgets/app_button.dart';
import 'checkout.dart';

class SelectSpaceship extends StatefulWidget {
  SelectSpaceship({Key key}) : super(key: key);

  @override
  _SelectSpaceshipState createState() => _SelectSpaceshipState();
}

class _SelectSpaceshipState extends State<SelectSpaceship>
    with SingleTickerProviderStateMixin {
  SpaceshipService spaceshipService = SpaceshipServiceInMemoryImpl();

  AnimationController animationController;
  Animation<double> animation;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(duration: const Duration(seconds: 1), vsync: this);
    animation = Tween<double>(begin: 0, end: 300).animate(animationController)
      ..addListener(() {
        setState(() {});
      });

    animationController.forward();
    animationController.repeat(reverse: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              _buildAppBar(),
              _buildHeader(),
              _buildCarousel(),
            ],
          ),
          AppButton(
            'BOOK A SEAT',
            onTap: () => Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => Checkout(),
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget _buildHeader() {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 40.0),
      child: Text(
        "SELECT SPACESHIP",
        style: const TextStyle(
          fontFamily: 'Futura',
          fontWeight: FontWeight.w700,
          fontSize: 14.0,
        ),
      ),
    );
  }

  Widget _buildCarousel() {
    return StreamBuilder(
      stream: spaceshipService.getSpaceships().asStream(),
      builder: (BuildContext context, AsyncSnapshot<List<Spaceship>> state) {
        if (state.hasData) {
          return Transform.scale(
              scale: 1.2,
              child: CarouselSlider(
                items: state.data.map(_buildSpaceshipTile).toList(),
                options: CarouselOptions(
                  height: 400.0,
                  aspectRatio: 1.25,
                  enlargeCenterPage: true,
                  viewportFraction: 0.63,
                ),
              ));
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _buildAppBar() {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          AppBackButton(
            onPressed: () => Navigator.of(context).pop(),
          ),
          Image.asset('assets/logo.png'),
          const SizedBox(width: 66.0)
        ],
      ),
    );
  }

  Widget _buildSpaceshipTile(Spaceship spaceship) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            'assets/spaceships/spaceship_tile.png',
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: animationController.value),
            child: Transform.scale(
              scale: 1.3,
              child: Image.asset(
                spaceship.image,
                height: 250.0,
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.only(left: 23.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                Text(
                  '${spaceship.description}\n\$${spaceship.price.toStringAsFixed(2)}\n${spaceship.description}',
                  style: const TextStyle(
                    fontFamily: 'Futura',
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                    color: Color(0XFFD1E2F4),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
