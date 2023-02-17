import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planner_app/home_screen.dart';
import 'package:planner_app/timer.dart';
import 'package:slide_digital_clock/slide_digital_clock.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:clock_loader/clock_loader.dart';
void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {


    // TODO: implement build
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0xFF2D2F41)
      ),
      home: MyHomePage(),
    );
  }

}

class MyHomePage extends StatefulWidget{
  MyHomePage({Key? key}): super(key: key);

  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>{
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  List<Widget> pageList = <Widget>[];



  // static const List<Widget> _widgetOptions = <Widget>[
  //   Text(
  //     'Index 0: Home',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 1: Alarm',
  //     style: optionStyle,
  //   ),
  //   Text(
  //     'Index 2: Timer',
  //     style: optionStyle,
  //   ),
  // ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void initState() {
    pageList.add(home_screen());
    pageList.add(TimerScreen());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const double size_of_icon = 40;
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: pageList,
      ),

        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                // begin: Alignment.bottomLeft,
                // end: Alignment.centerRight,
                  colors: [
                    // Colors.indigo.shade900,
                    // Colors.pinkAccent,
                    Color(0xFF2D2F41),
                    Colors.blueGrey.shade400,
                  ])),
          child: BottomNavigationBar(
            backgroundColor: Colors.transparent,
            // Color(0xFF2D2F41),
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                  icon: Icon(
                    Icons.alarm,
                    size: size_of_icon,
                  ),
                  label: 'Home'),
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
            unselectedItemColor: Colors.white,
            selectedItemColor: Colors.amber,
            selectedFontSize: 15,
            unselectedFontSize: 15,
            onTap: _onItemTapped,
          ),
        )
    );
  }
  
}







