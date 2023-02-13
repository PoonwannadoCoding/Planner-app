import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:simple_circular_progress_bar/simple_circular_progress_bar.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}


class _HomePageState extends State<HomePage> {
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
    });
  }

  @override
  Widget build(BuildContext context) {
    const double size_of_icon = 40;
    final now = DateTime.now();

    return Scaffold(
      backgroundColor: Colors.blueGrey[900],

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Container(
            margin: const EdgeInsets.only(left: 30),
            child:
            SimpleCircularProgressBar(
              progressStrokeWidth: 30,
              backStrokeWidth: 30,
              size: 350,
              mergeMode: true,
              animationDuration: 30,
            ),
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.blueGrey[900],
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(
                Icons.home,
              size: size_of_icon,
            ),
            label: 'Home'

          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.business,
              size: size_of_icon,
            ),
            label: 'Alarm',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                Icons.school,
              size: size_of_icon,
            ),
            label: 'Timer',

          ),
        ],
        currentIndex: _selectedIndex,
        unselectedItemColor: Colors.cyan,
        selectedItemColor: Colors.amber[800],

        selectedFontSize: 15,
        unselectedFontSize: 15,
        onTap: _onItemTapped,
      ),
    );
  }
}
