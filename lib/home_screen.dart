import 'package:flutter/cupertino.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:clock_loader/clock_loader.dart';
import 'package:percent_indicator/percent_indicator.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _HomePageState();
}

class _HomePageState extends State<home_screen> with TickerProviderStateMixin {
  int _selectedIndex = 0;
  late AnimationController controller;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static const List<Widget> _widgetOptions = <Widget>[
    Text(
      'Index 0: Home',
      style: optionStyle,
    ),
    Text(
      'Index 1: Alarm',
      style: optionStyle,
    ),
    Text(
      'Index 2: Timer',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;

    });
  }

  @override
  void initState() {
    controller = AnimationController(
      duration: const Duration(seconds: 61),
      vsync: this,
    )..addListener(() {
        setState(() {});
      });
    controller.repeat(reverse: false);
    // super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double size_of_icon = 40;

    return Scaffold(
        // appBar: AppBar(
        //    backgroundColor: Color(0xFF2D2F41),
        //   title: Text("SLEEP CYCLE"),
        // ),

        body: Center(
          child: Container(
            decoration: BoxDecoration(color: Color(0xFF2D2F41)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    "SLEEP CYCLE",
                    style: TextStyle(
                      fontSize: 80,
                      fontFamily: 'Technology',
                      color: Colors.white,
                    ),
                  ),
                ),
                Container(
                  margin: EdgeInsets.all(20),
                  // height: 180,
                  decoration: BoxDecoration(
                    // color: Colors.purple.shade200,

                    gradient: LinearGradient(
                        begin: Alignment.bottomLeft,
                        end: Alignment.centerRight,
                        colors: [
                          Colors.indigo.shade900,
                          Colors.purple.shade700,
                          Colors.pinkAccent,
                          //
                          // Colors.blueGrey.shade400,
                          // Colors.blueGrey.shade900,
                        ]),

                    borderRadius: const BorderRadius.all(Radius.circular(40)),
                  ),

                  child: Column(
                    children: [
                      Container(
                        child: DigitalClock(
                          hourMinuteDigitTextStyle: const TextStyle(
                              fontSize: 120,
                              color: Colors.white,
                              fontFamily: 'Technology'),
                          secondDigitTextStyle: const TextStyle(
                              fontSize: 50,
                              color: Colors.white,
                              fontFamily: 'Technology'),
                          colon: const Icon(Icons.ac_unit, size: 20),
                          colonDecoration: BoxDecoration(
                              border: Border.all(),
                              shape: BoxShape.circle,
                              color: Colors.white),
                        ),
                      ),
                      Container(
                        child: Text(
                          DateTime.now().day.toString() +
                              "/" +
                              DateTime.now().month.toString() +
                              "/" +
                              DateTime.now().year.toString(),
                          style: const TextStyle(
                            fontSize: 40,
                            color: Colors.white,
                            fontFamily: 'Technology',
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(top: 40),
                  height: 280,
                  width: 280,
                  child: CircularProgressIndicator(
                    value: DateTime.now().second.toDouble() / 60,
                    strokeWidth: 20,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
}
