import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);
  // Timer? countdownTimer;

  @override
  State<AlarmScreen> createState() => alarmScreenState();
}


class alarmScreenState extends State<AlarmScreen>{
  String current_hour = DateTime.now().hour.toString();
  String current_min = DateTime.now().minute.toString();

  int awake_hour = DateTime.now().hour.toInt();
  int awake_min = DateTime.now().minute.toInt();

  late String current_time;

  void initState(){
    current_time = "$current_hour:$current_min";
    Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        String update_hour = DateTime.now().hour.toString();
        String update_min = DateTime.now().minute.toString();
        current_time = "$update_hour:$update_min";
      });
    }
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: const Text("SLEEP CYCLE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontFamily: 'Technology'
              ),
              ),
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 180,
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
                          ]
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Center(
                      child: Text(
                        "$current_time",
                        style: TextStyle(
                            fontSize: 50,
                            fontFamily: 'Technology',
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),

                  Container(
                    child: Text(
                      "=>",
                      style: TextStyle(
                          fontSize: 40,
                          fontFamily: 'Technology',
                          color: Colors.white
                      ),
                    ),
                  ),
                  Container(
                    width: 180,
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
                          ]
                      ),
                      borderRadius: const BorderRadius.all(Radius.circular(40)),
                    ),
                    child: Center(
                      child: Text(
                        "$awake_hour:$awake_min",
                        style: const TextStyle(
                            fontSize: 50,
                            fontFamily: 'Technology',
                            color: Colors.white
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),

            Container(
              child: SleekCircularSlider(
                min: 0,
                max: 1440,
                initialValue: 0,
                onChange: (double mins){
                  setState(() {
                    if ((awake_hour + mins/60).toInt() < 24){
                      awake_hour = (awake_hour + mins/60).toInt();
                    } else {
                      awake_hour = 0;
                    }

                    if ((awake_min + mins%60).toInt() < 60){
                      awake_min = (awake_min + mins%60).toInt();
                    } else {
                      awake_min = 0;
                    }


                  });
                },
              ),
            )

          ],
        ),
      ),
    );
  }
  
}
