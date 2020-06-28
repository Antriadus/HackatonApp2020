import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack2020/pages/thank_you.dart';
import 'package:hack2020/widgets/app_tile.dart';

import '../widgets/app_back_button.dart';

class YourTickets extends StatefulWidget {
  YourTickets({Key key}) : super(key: key);

  @override
  _YourTicketsState createState() => _YourTicketsState();
}

class _YourTicketsState extends State<YourTickets> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            _buildAppBar(),
            _buildHeader(),
            _buildTicketsList(),
          ],
        ),
      ),
    );
  }

  Widget _buildTicketsList() {
    return Container(
      width: 343,
      child: ListView.builder(
        shrinkWrap: true,
        itemCount: 1,
        itemBuilder: (context, index) => _buildTicketTile(),
      ),
    );
  }

  Widget _buildTicketTile() {
    return AppTile(
      onTap: _openTicketPreview,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
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
                SizedBox(
                  width: 40.0,
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
            Container(
              width: 54,
              height: 54,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.white.withOpacity(0.05),
                    offset: Offset(-5, -5),
                    blurRadius: 15.0,
                  ),
                  BoxShadow(
                    color: Colors.black.withOpacity(0.55),
                    offset: Offset(8, 8),
                    blurRadius: 45.0,
                  )
                ],
                borderRadius: BorderRadius.all(
                  Radius.circular(4.0),
                ),
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [const Color(0XFF333F5B), const Color(0XFF191F28)],
                ),
              ),
              child: Center(
                child: Text(
                  "QR",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14.0),
                ),
              ),
            )
          ],
        ),
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
      padding: EdgeInsets.symmetric(vertical: 40.0),
      child: Text(
        "YOUR TICKETS",
        style: const TextStyle(
          fontFamily: 'Futura',
          fontWeight: FontWeight.w700,
          fontSize: 14.0,
        ),
      ),
    );
  }

  void _openTicketPreview() {
    showCupertinoModalPopup(
      context: context,
      builder: (context) {
        return Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                const Color(0XFF333F5B),
                const Color(0XFF181E27),
              ],
            ),
          ),
          width: double.infinity,
          margin: EdgeInsets.only(top: 100.0),
          child: Material(
            color: Colors.transparent,
            child: Column(
              children: <Widget>[
                const SizedBox(height: 10.0),
                Image.asset('assets/line.png'),
                const SizedBox(height: 50.0),
                Image.asset('assets/qr.png'),
                const SizedBox(height: 20.0),
                AppTile(
                  child: Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
                    margin:
                        EdgeInsets.symmetric(horizontal: 16.0, vertical: 10),
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
          ),
        );
      },
    );
  }
}
