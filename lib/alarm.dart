import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'package:sleek_circular_slider/sleek_circular_slider.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:audioplayers/audioplayers.dart';

class AlarmScreen extends StatefulWidget {
  const AlarmScreen({Key? key}) : super(key: key);
  // Timer? countdownTimer;

  @override
  State<AlarmScreen> createState() => alarmScreenState();
}


class alarmScreenState extends State<AlarmScreen>{
  static double percents = 0;
  bool isSwitched =false;
  final player = AudioPlayer();
  Timer? countdownTimer;
  Timer? timer;
  bool isDone = false;
  String current_hour = DateTime.now().hour.toString();
  String current_min = DateTime.now().minute.toString();
  double record_mins = 0;
  int awake_hour = DateTime.now().hour.toInt();
  int awake_min = DateTime.now().minute.toInt();
  static int hh = 0;
  static int mm = 0;
  late String current_time;
  static int awake_hh = 0;
  static int awake_mm = 0;
  static int awake_ss = 0;
  Duration count_down_duration = Duration(hours: hh, minutes: mm, seconds: awake_ss);
  int rec_sec = 0;
  int current_sec = 0;


  int countcycle(){

    return (record_mins~/90);
  }

  void runBar(){
    timer = Timer.periodic(Duration(seconds: 1), (_) {

      setState(() {
        if (current_sec < rec_sec){
          current_sec += 1;
          percents = current_sec/rec_sec;
        } else {
          rec_sec = 0;
          current_sec = 0;
          percents = 0;
          resetTimer();
          isDone = true;
          isSwitched =false;
        }
      });

    });
  }

  void initState(){
    current_time = "$current_hour:$current_min";

    Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        String updateHour = DateTime.now().hour.toString();
        String updateMin = DateTime.now().minute.toString();
        current_time = "$updateHour:$updateMin";
      });
    }
    );
    super.initState();
  }

  void startTimer(){
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setContDown());
  }

  void stopTimer(){
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer() {
    stopTimer();
    awake_hh = 0;
    awake_mm = 0;
    awake_ss = 0;
    setState(() =>
    count_down_duration = const Duration(hours: 0, minutes: 0, seconds: 0)
    );
  }
  void setContDown(){
    final reduceSecondsBy = 1;
    setState(() {
      int seconds = count_down_duration.inSeconds - reduceSecondsBy;
      if (count_down_duration.inSeconds == 0){
        stopTimer();

        playAlarm();
        loop();




      } else {
        count_down_duration = Duration(seconds: seconds);
      }
    });
  }

  void playAlarm() async{
    player.play(AssetSource('alarm1.mp3'));
  }
  void loop(){
    player.setReleaseMode(ReleaseMode.loop);
  }


  
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),

      body: Center(
        child: Column(

          children: [
            Container(
              margin: const EdgeInsets.only(top: 85),
              child: const Text("SLEEP CYCLE",
              style: TextStyle(
                color: Colors.white,
                fontSize: 80,
                fontFamily: 'Technology'
              ),
              ),
            ),
            Container(
              margin: const EdgeInsets.only(top: 20),
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
              margin: const EdgeInsets.only(top: 20),
              child: isSwitched == false?
              SleekCircularSlider(
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
                        mm = (record_mins % 60).toInt();

                        count_down_duration = Duration(hours: hh, minutes: mm, seconds: 0);
                        return "\t\tSleep time\n${count_down_duration.inHours} hour ${count_down_duration.inMinutes%60} min\n \t${count_down_duration.inSeconds%60} Second";
                      }
                    ),
                ),



                min: 0,
                max: 1440,
                initialValue: count_down_duration.inMinutes.toDouble(),
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
                      awake_min = (awake_min + record_mins%60 - 60).toInt();
                    }
                  });
                },

              ):
              CircularPercentIndicator(
                radius: 150,
                lineWidth: 10,
                progressColor: Colors.orange.shade700,
                percent: percents,
                center: Text("\t\tSleep time\n${count_down_duration.inHours} hour ${count_down_duration.inMinutes%60} min\n \t${count_down_duration.inSeconds%60} Second",
                style: const TextStyle(
                  fontSize: 40,
                  fontFamily: 'Technology',
                  color: Colors.white
                ),),
              ),

            ),

            Container(
              margin: const EdgeInsets.only(top: 40),

              decoration: BoxDecoration(
                color: Color(0xFF2D2F41),

                border: Border.all(color: Colors.purple.shade50),
                borderRadius: const BorderRadius.all(Radius.circular(40)),
              ),
              child: TextButton(
                child: Text("${countcycle()} Cycle",
                  style:
                  const TextStyle(
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
                    if ((awake_hour + record_mins~/60) < 24){
                      awake_hour = (awake_hour + record_mins~/60);
                    } else {
                      awake_hour = awake_hour + record_mins~/60 - 24;
                    }

                    if ((awake_min + record_mins%60).toInt() < 60){
                      awake_min = (awake_min + record_mins%60).toInt();
                    } else {
                      awake_min = (awake_min + record_mins%60 - 60).toInt();
                    }
                  });
                },
              ),
            ),

            Container(
              margin: const EdgeInsets.only(top: 20),
              child: Switch(
                value: isSwitched,
                onChanged: (bool value) {
                  setState(() {
                    isSwitched = value;
                    int h = record_mins~/60;
                    int m = (record_mins%60).toInt();
                    count_down_duration = Duration(hours: h, minutes: m);
                    if(value == true){
                      startTimer();
                      rec_sec = count_down_duration.inSeconds;
                      print(rec_sec);
                      runBar();
                    } else {
                      resetTimer();
                    }

                  });
                },
                activeTrackColor: Colors.orangeAccent,
                activeColor: Colors.white,
              ),
            ),

            Container(
              child: isDone?
              IconButton(
                onPressed: (){
                  setState(() {
                    player.stop();
                    isDone = false;
                  });
                },
                icon: Icon(Icons.stop_circle_outlined, color: Colors.white, size: 40,),
              ):
              Text("")
            ),
          ],
        ),
      ),
    );
  }
  
}
