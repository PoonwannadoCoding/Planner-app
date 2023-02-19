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
  double record_mins = 0;
  int awake_hour = DateTime.now().hour.toInt();
  int awake_min = DateTime.now().minute.toInt();
  static int hh = 0;
  static int mm = 0;
  late String current_time;

  int countcycle(){
    if (record_mins~/60 > 1){
      return (record_mins~/60)-1;
    } else {
      return (record_mins~/60);
    }

  }

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
                        style: const TextStyle(
                            fontSize: 50,
                            fontFamily: 'Technology',
                            color: Colors.white
                        ),
                      ),
                    ),
                  ),

                  Container(
                    child: const Text(
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
                appearance: CircularSliderAppearance(
                    size: 300,
                    customColors: CustomSliderColors(
                      trackColor: Colors.grey,
                      progressBarColors: record_mins%90==0?
                      [Colors.greenAccent,Colors.greenAccent]:
                      [Colors.pinkAccent, Colors.pink.shade900],
                      dotColor: Colors.pink.shade50,
                    ),
                    customWidths: CustomSliderWidths(
                        trackWidth: 10,
                        progressBarWidth: 15,
                        shadowWidth: 20
                    ),
                    infoProperties: InfoProperties(
                        mainLabelStyle: TextStyle(
                          fontFamily: 'Technology',
                          fontSize: 40,
                          color: record_mins%90==0?
                              Colors.greenAccent:
                              Colors.white
                        ),

                      modifier: (double mins){
                        hh = record_mins~/60;
                        mm = (record_mins%60).toInt();
                        return "\t\tSleep time\n$hh hour $mm mins";
                      }
                    ),
                ),



                min: 0,
                max: 1440,
                initialValue: record_mins,
                onChange: (double mins){
                  setState(() {
                    record_mins = mins.toDouble();
                    awake_hour = DateTime.now().hour.toInt();
                    awake_min = DateTime.now().minute.toInt();
                    if ((awake_hour + record_mins/60).toInt() < 24){
                      awake_hour = (awake_hour + record_mins/60).toInt();
                    } else {
                      awake_hour = awake_hour + record_mins~/60.toInt() - 24;
                    }

                    if ((awake_min + record_mins%60).toInt() < 60){
                      awake_min = (awake_min + record_mins%60).toInt();
                    } else {
                      awake_min = (record_mins%60).toInt();
                    }


                  });
                },

              ),
            ),

            Container(
              decoration: BoxDecoration(
                color: Color(0xFF2D2F41),

                border: Border.all(color: Colors.purple.shade50),
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),
              child: TextButton(
                child: Text("${countcycle()} Cycle",
                  style:
                  TextStyle(
                    fontFamily: 'Technology',
                    fontSize: 30,
                    color: Colors.white
                  ),
                ),
                onPressed: (){
                  setState(() {
                    if(record_mins + 90 < 1440) {
                      record_mins = record_mins + 90;
                    } else {
                      record_mins = record_mins + 0;
                    }

                    awake_hour = DateTime.now().hour.toInt();
                    awake_min = DateTime.now().minute.toInt();
                    if ((awake_hour + record_mins/60).toInt() < 24){
                      awake_hour = (awake_hour + record_mins/60).toInt();
                    } else {
                      awake_hour = awake_hour + record_mins~/60.toInt() - 24;
                    }

                    if ((awake_min + record_mins%60).toInt() < 60){
                      awake_min = (awake_min + record_mins%60).toInt();
                    } else {
                      awake_min = (record_mins%60).toInt();
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
