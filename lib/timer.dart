import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => timerPageState();
}

class timerPageState extends State<TimerScreen>{
  int _selectedIndex = 2;

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
      // print(index);

      if (_selectedIndex == 0){
        Navigator.pushNamed(context, '/');
      }
      if (_selectedIndex == 2){
        Navigator.pushNamed(context, '/timer_screen');
      }

    });
  }


  @override
  Widget build(BuildContext context) {
    const double size_of_icon = 40;


    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),
        bottomNavigationBar:Container(
          decoration: BoxDecoration(

              gradient: LinearGradient(
                // begin: Alignment.bottomLeft,
                // end: Alignment.centerRight,
                  colors: [
                    // Colors.indigo.shade900,
                    // Colors.pinkAccent,
                    Color(0xFF2D2F41),
                    Colors.blueGrey.shade400,

                  ]
              )
          ),
          child:
          BottomNavigationBar(
            backgroundColor: Colors.transparent,
            // Color(0xFF2D2F41),
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