import 'package:flutter/material.dart';
import 'package:hack2020/pages/thank_you.dart';
import 'package:hack2020/widgets/app_tile.dart';

import '../widgets/app_button.dart';

class Checkout extends StatelessWidget {
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Column(
            children: <Widget>[
              AppTile(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Row(
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'FROM',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Futura',
                                fontWeight: FontWeight.w700,
                                color: const Color(0XFFEAEAEA)),
                          ),
                          Text(
                            'EARTH',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Futura',
                                fontWeight: FontWeight.w500,
                                color: const Color(0XFFA7B3BF)),
                          )
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Image.asset('assets/curved_arrow.png'),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'DESTINATION',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Futura',
                                fontWeight: FontWeight.w700,
                                color: const Color(0XFFEAEAEA)),
                          ),
                          Text(
                            'Neptune',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Futura',
                                fontWeight: FontWeight.w500,
                                color: const Color(0XFFA7B3BF)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AppTile(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Text(
                          'SPACESHIP',
                          style: TextStyle(
                              fontSize: 14.0,
                              fontFamily: 'Futura',
                              fontWeight: FontWeight.w700,
                              color: const Color(0XFFEAEAEA)),
                        ),
                        Text(
                          'Spaceship name',
                          style: TextStyle(
                              fontSize: 15.0,
                              fontFamily: 'Futura',
                              fontWeight: FontWeight.w500,
                              color: const Color(0XFFA7B3BF)),
                        )
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 16.0),
                      child: Transform.scale(
                        scale: 2.6,
                        child: Image.asset('assets/spaceships/1.png'),
                      ),
                    ),
                  ],
                ),
              )),
              AppTile(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'SEATS',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Futura',
                                fontWeight: FontWeight.w700,
                                color: const Color(0XFFEAEAEA)),
                          ),
                          Text(
                            '1, 2, 3, 4, 5',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Futura',
                                fontWeight: FontWeight.w500,
                                color: const Color(0XFFA7B3BF)),
                          )
                        ],
                      ),
                      Container(
                        width: 20.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          Text(
                            'PRICE',
                            style: TextStyle(
                                fontSize: 14.0,
                                fontFamily: 'Futura',
                                fontWeight: FontWeight.w700,
                                color: const Color(0XFFEAEAEA)),
                          ),
                          Text(
                            '1000 Moon Coins',
                            style: TextStyle(
                                fontSize: 15.0,
                                fontFamily: 'Futura',
                                fontWeight: FontWeight.w500,
                                color: const Color(0XFFFF6A00)),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
