import 'package:flutter/material.dart';
import 'package:hack2020/models/planet.dart';
import 'package:hack2020/models/spaceship.dart';
import 'package:hack2020/widgets/app_tile.dart';
import 'package:rxdart/rxdart.dart';

class Checkout extends StatelessWidget {
  final BehaviorSubject<Planet> planetSubject;
  final BehaviorSubject<Spaceship> spaceshipSubject;
  final BehaviorSubject<List<int>> selectedSeatsSubject;

  const Checkout({
    Key key,
    @required this.planetSubject,
    @required this.spaceshipSubject,
    @required this.selectedSeatsSubject,
  }) : super(key: key);

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
                          StreamBuilder<Planet>(
                              stream: planetSubject,
                              builder: (context, snapshot) {
                                return Text(
                                  snapshot?.data?.name ?? "",
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'Futura',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0XFFA7B3BF)),
                                );
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              AppTile(
                  child: Container(
                margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                child: StreamBuilder<Spaceship>(
                    stream: spaceshipSubject,
                    initialData: spaceshipSubject.value,
                    builder: (context, snapshot) {
                      return Row(
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
                                snapshot?.data?.name ?? "",
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
                              child: Hero(
                                  tag: 'spaceship',
                                  child: Image.asset(snapshot?.data?.image)),
                            ),
                          ),
                        ],
                      );
                    }),
              )),
              AppTile(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
                  child: StreamBuilder<List<int>>(
                      stream: selectedSeatsSubject,
                      initialData: [],
                      builder: (context, snapshot) {
                        var seatNumbers = snapshot.data.join(',');

                        if (seatNumbers.isNotEmpty)
                          seatNumbers =
                              seatNumbers.substring(0, seatNumbers.length - 1);
                        return Row(
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
                                  seatNumbers,
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
                                  '${snapshot.data.length * 1000} Moon Coins',
                                  style: TextStyle(
                                      fontSize: 15.0,
                                      fontFamily: 'Futura',
                                      fontWeight: FontWeight.w500,
                                      color: const Color(0XFFFF6A00)),
                                )
                              ],
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
