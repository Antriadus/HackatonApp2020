import 'package:flutter/material.dart';

import '../widgets/app_back_button.dart';
import '../widgets/app_button.dart';
import 'your_tickets.dart';

class ThankYou extends StatefulWidget {
  ThankYou({Key key}) : super(key: key);

  @override
  _ThankYouState createState() => _ThankYouState();
}

class _ThankYouState extends State<ThankYou> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildHeader(),
            _buildSpaceship(),
          ],
        ),
      ),
    );
  }

  Widget _buildSpaceship() {
    return Container(
      margin: const EdgeInsets.only(bottom: 70.0),
      child: Column(
        children: <Widget>[
          Image.asset('assets/spaceships/1.png'),
          Text(
            "Spaceship name",
            style: const TextStyle(
                color: const Color(0XFFEAEAEA),
                fontSize: 14.0,
                fontWeight: FontWeight.w700,
                fontFamily: 'Futura'),
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            "is waiting for You",
            style: const TextStyle(
                color: const Color(0XFFA7B3BF),
                fontSize: 15.0,
                fontWeight: FontWeight.w500,
                fontFamily: 'Futura'),
          )
        ],
      ),
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

  Widget _buildHeader() {
    return Container(
      width: double.infinity,
      child: Image.asset('assets/thank_you.png'),
    );
  }

  Widget _buildCheckoutTile({@required Widget child}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10.0),
      width: 343,
      height: 83,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white.withOpacity(0.08),
            offset: Offset(-8, -10),
            blurRadius: 35,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.32),
            offset: Offset(10, 10),
            blurRadius: 35,
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(17)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            const Color(0XFF2D384C),
            const Color(0XFF1A222D),
          ],
        ),
      ),
      child: child,
    );
  }
}
