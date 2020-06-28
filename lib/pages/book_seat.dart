import 'package:flutter/material.dart';
import 'package:hack2020/enums/spaceship_type.dart';
import '../models/spaceship.dart';

class BookSeat extends StatefulWidget {
  final Spaceship spaceship;
  const BookSeat({@required this.spaceship});

  @override
  _BookSeatState createState() => _BookSeatState();
}

class _BookSeatState extends State<BookSeat> {
  double seatTileSizeInScreenPercent = 0.03;
  Color seatTileGradientFirst = const Color(0xFF353F59);
  Color seatTileGradientSecond = const Color(0xFF191E26);
  Color selectedSeatTileGradientFirst = const Color(0xFFEE0979);
  Color selectedSeatTileGradientSecond = const Color(0xFFFF6A00);
  Duration animationDuration = const Duration(milliseconds: 250);
  TextStyle defaultTextStyle = const TextStyle(
    fontFamily: 'Futura',
    fontWeight: FontWeight.w700,
    fontSize: 14.0,
  );
  int missedSeats;
  List<dynamic> seatsList;
  List<int> selectedSeatsList;

  @override
  void initState() {
    missedSeats = 0;
    seatsList = List<int>.generate(
        widget.spaceship.seatsCount, (i) => _generateSeatList(i));
    selectedSeatsList = [];
    super.initState();
  }

  int _generateSeatList(int i) {
    List<int> filter;
    switch (widget.spaceship.type) {
      case SpaceshipType.First:
        filter = [2, 3, 8, 9, 14, 15];
        break;
      case SpaceshipType.Oval:
        filter = [0, 1, 4, 5, 6, 11, 30, 35, 36, 37, 40, 41];
        break;
      case SpaceshipType.Rocket:
        filter = [
          0,
          1,
          4,
          5,
          6,
          7,
          10,
          11,
          12,
          13,
          16,
          17,
          18,
          23,
          24,
          30,
          36,
          29,
          35,
          41,
          38,
          39
        ];
        break;
      default:
        filter = [2, 3, 8, 9, 14, 15];
        break;
    }
    if (filter.contains(i)) {
      missedSeats++;
      return null;
    }
    print(missedSeats);
    return i + 1 - missedSeats;
  }

  void _handleSeatTileTap(int seatInt, bool isSelected) {
    if (isSelected) {
      selectedSeatsList.remove(seatInt);
    } else {
      selectedSeatsList.add(seatInt);
    }
    print(selectedSeatsList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _buildSeats();
  }

  Widget _buildSeats() {
    return Flexible(
      child: Container(
        alignment: Alignment.center,
        padding: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.04,
          right: MediaQuery.of(context).size.width * 0.04,
          // bottom: MediaQuery.of(context).size.height * 0.1,
        ),
        child: GridView.count(
          crossAxisCount: 6,
          childAspectRatio: 1,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          children:
              seatsList.map((seatInt) => _buildSeatTile(seatInt)).toList(),
        ),
      ),
    );
  }

  Widget _buildSeatTile(int seatInt) {
    final bool _isSelected = selectedSeatsList.contains(seatInt);
    return seatInt != null
        ? GestureDetector(
            onTap: () => _handleSeatTileTap(seatInt, _isSelected),
            child: AnimatedContainer(
              duration: animationDuration,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(4)),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(-6, -6),
                        color: Color(0xFFFFFFFF).withOpacity(0.05),
                        blurRadius: 15)
                  ],
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: _isSelected
                        ? [
                            selectedSeatTileGradientFirst,
                            selectedSeatTileGradientSecond
                          ]
                        : [
                            seatTileGradientFirst,
                            seatTileGradientSecond,
                          ],
                  )),
              child: Text(seatInt.toString(), style: defaultTextStyle),
            ),
          )
        : Container();
  }
}
