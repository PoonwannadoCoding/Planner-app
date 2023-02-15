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





