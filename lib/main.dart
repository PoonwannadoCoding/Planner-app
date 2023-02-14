import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:planner_app/home_screen.dart';
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
      initialRoute: '/',
      routes: {
        '/': (context) => const home_screen(),
      },
    );
  }

}
//
//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const HomePage(),
//     );
//   }
// }
//
// class HomePage extends StatefulWidget {
//   const HomePage({Key? key}) : super(key: key);
//
//   @override
//   State<HomePage> createState() => _HomePageState();
// }
//
//
// class _HomePageState extends State<HomePage> {
//   int _selectedIndex = 0;
//
//   static const TextStyle optionStyle =
//   TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
//   static const List<Widget> _widgetOptions = <Widget>[
//     Text(
//       'Index 0: Home',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 1: Alarm',
//       style: optionStyle,
//     ),
//     Text(
//       'Index 2: Timer',
//       style: optionStyle,
//     ),
//   ];
//
//   void _onItemTapped(int index) {
//     setState(() {
//       _selectedIndex = index;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     const double size_of_icon = 40;
//     final DateTime now = DateTime.now();
//
//     return Scaffold(
//
//
//       body: Center(
//
//
//
//         child: Container(
//           decoration: BoxDecoration(
//               gradient: LinearGradient(
//                   begin: Alignment.topLeft,
//                   end: Alignment.bottomRight,
//                   colors: [
//                     Colors.cyanAccent.shade700,
//                     Colors.blueGrey.shade900,
//                   ]
//               )
//           ),
//           child: Column(
//
//             mainAxisAlignment: MainAxisAlignment.center,
//
//             children: [
//
//               Container(
//                 child: DigitalClock(
//                   hourMinuteDigitTextStyle: const TextStyle(fontSize: 100,
//                       color: Colors.tealAccent
//                   ),
//                   secondDigitTextStyle: TextStyle(fontSize: 30,
//                   color: Colors.tealAccent),
//                   colon: const Icon(Icons.ac_unit, size: 20),
//                   colonDecoration: BoxDecoration(
//                       border: Border.all(), shape: BoxShape.circle),
//                 ),
//               ),
//               Container(
//                 child: ClockLoader(
//                   clockLoaderModel: ClockLoaderModel(
//                     shapeOfParticles: ShapeOfParticlesEnum.circle,
//                     mainHandleColor: Colors.tealAccent,
//                     particlesColor: Colors.tealAccent,
//                   ),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ),
//
//
//       bottomNavigationBar: BottomNavigationBar(
//         backgroundColor: Colors.blueGrey[900],
//         items: const <BottomNavigationBarItem>[
//
//           BottomNavigationBarItem(
//             icon: Icon(
//                 Icons.alarm,
//               size: size_of_icon,
//             ),
//             label: 'Home'
//
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//               Icons.bed,
//               size: size_of_icon,
//             ),
//             label: 'Alarm',
//           ),
//           BottomNavigationBarItem(
//             icon: Icon(
//                 Icons.hourglass_bottom,
//               size: size_of_icon,
//             ),
//             label: 'Timer',
//
//           ),
//         ],
//         currentIndex: _selectedIndex,
//         unselectedItemColor: Colors.cyan,
//         selectedItemColor: Colors.tealAccent,
//
//         selectedFontSize: 15,
//         unselectedFontSize: 15,
//         onTap: _onItemTapped,
//       ),
//     );
//
//   }





