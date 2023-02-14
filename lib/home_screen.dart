import 'package:flutter/cupertino.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:clock_loader/clock_loader.dart';
class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);
  @override
  State<home_screen> createState() => _HomePageState();
}

  class _HomePageState extends State<home_screen> {
  int _selectedIndex = 0;

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
      print(index);
    });
  }


  @override
  Widget build(BuildContext context) {
    const double size_of_icon = 40;
    final DateTime now = DateTime.now();

    return Scaffold(


      body: Center(


        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.indigo.shade900,
                    Colors.purple.shade700,
                    Colors.pink.shade900,
                  ]
              )
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Container(
                child: DigitalClock(
                  hourMinuteDigitTextStyle: const TextStyle(fontSize: 100,
                      color: Colors.white
                  ),
                  secondDigitTextStyle: const TextStyle(fontSize: 30,
                      color: Colors.white),
                  colon: const Icon(Icons.ac_unit, size: 20),
                  colonDecoration: BoxDecoration(
                      border: Border.all(), shape: BoxShape.circle, color: Colors.white),
                ),
              ),
              Container(
                child: ClockLoader(
                  clockLoaderModel: ClockLoaderModel(
                    shapeOfParticles: ShapeOfParticlesEnum.circle,
                    mainHandleColor: Colors.white,
                    particlesColor: Colors.white,
                  ),
                ),
              ),
            ],
          ),
        ),

      ),

      bottomNavigationBar:Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Colors.indigo.shade900,
              Colors.purple.shade700,

            ]
          )
        ),
        child:
        BottomNavigationBar(
          backgroundColor: Colors.transparent,
          items: const <BottomNavigationBarItem>[

            BottomNavigationBarItem(
                icon: Icon(
                  Icons.alarm,
                  size: size_of_icon,
                ),
                label: 'Home'

            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.bed,
                size: size_of_icon,
              ),
              label: 'Alarm',
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.hourglass_bottom,
                size: size_of_icon,
              ),
              label: 'Timer',

            ),
          ],
          currentIndex: _selectedIndex,
          unselectedItemColor: Colors.pink.shade200,
          selectedItemColor: Colors.pinkAccent,


          selectedFontSize: 15,
          unselectedFontSize: 15,
          onTap: _onItemTapped,
        ),
      )
    );
  }
}

