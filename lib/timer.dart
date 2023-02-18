import 'dart:async';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);
  // Timer? countdownTimer;

  @override
  State<TimerScreen> createState() => timerPageState();
}

class timerPageState extends State<TimerScreen>{
  Timer? countdownTimer;
  static int hour = 0;
  static int minuite = 0;
  static int second = 0;
  int isPushed = 0;


  Duration count_down_duration = Duration(hours: hour, minutes: minuite, seconds: second);
  @override
  void initState(){
    super.initState();
  }

  void startTimer(){
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (_) => setContDown());
  }

  void stopTimer(){
    setState(() => countdownTimer!.cancel());
  }

  void resetTimer(){
    stopTimer();
    setState(() => count_down_duration = const Duration());
  }

  void setContDown(){
    final reduceSecondsBy = 1;
    setState(() {
      final seconds = count_down_duration.inSeconds - reduceSecondsBy;
      if (count_down_duration.inSeconds == 0){
        stopTimer();
        final player = AudioPlayer();
        player.play(AssetSource('alarm1.mp3'));
        
        isPushed = 0;

      } else {
        count_down_duration = Duration(seconds: seconds);
      }
    });
  }


  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);



  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),


        body: Center(
          child: Column(

            children: [
              Container(
                margin: const EdgeInsets.only(top: 85),
                child: const Text(
                  "COUNTDOWN",
                  style: TextStyle(
                    fontSize: 80,
                    fontFamily: 'Technology',
                    color: Colors.white,
                  ),
                ),
              ),

              Container(
                margin: const EdgeInsets.only(top: 85),

                width: 380,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(
                      Radius.circular(40)
                  ),
                  gradient: LinearGradient(
                      begin: Alignment.bottomLeft,
                      end: Alignment.centerRight,
                      colors: [
                        Colors.indigo.shade900,
                        Colors.purple.shade700,
                        Colors.pinkAccent,
                        // Colors.purpleAccent.shade700,
                        // Colors.pinkAccent.shade700,

                      ]
                    ),
                  ),

                  // child: Center(
                    child: Column(
                      children: [
                        Container(

                          child:

                              isPushed == 0?
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Container(

                                child: isPushed == 0?
                                NumberPicker(
                                  value: hour,
                                  minValue: 0,
                                  maxValue: 23,
                                  onChanged: (int value) => setState(() {
                                    hour = value;
                                  }

                                  ),
                                  selectedTextStyle: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Technology',
                                      fontSize: 50
                                  ),
                                ):
                                    Text(count_down_duration.inHours.toString(),
                                    style: const TextStyle(
                                        fontFamily: 'Technology',
                                        fontSize: 50,
                                        color: Colors.white
                                    ),),


                              ),

                              Container(
                                // width: 10,
                                child: const Text(
                                  "HH",
                                  style: TextStyle(
                                    fontFamily: 'Technology',
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                              ),

                        Container(
                                child: isPushed == 0?
                                NumberPicker(
                                  value: minuite,
                                  minValue: 0,
                                  maxValue: 59,
                                  onChanged: (int value) => setState(() {
                                    minuite = value;
                                  }

                                  ),
                                  selectedTextStyle: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Technology',
                                      fontSize: 50
                                  ),
                                ):
                                Text((count_down_duration.inMinutes%60).toString(),
                                  style: const TextStyle(
                                      fontFamily: 'Technology',
                                      fontSize: 50,
                                      color: Colors.white
                                  ),),
                              ),

                              Container(
                                child: const Text(
                                  "min",
                                  style: TextStyle(
                                    fontFamily: 'Technology',
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                              ),


                              Container(
                                child: isPushed == 0?
                                NumberPicker(

                                  value: second,
                                  minValue: 0,
                                  maxValue: 59,
                                  onChanged: (int value) => setState(() {
                                    second = value;
                                  }

                                  ),
                                  selectedTextStyle: const TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Technology',
                                      fontSize: 50
                                  ),
                                ):
                                Text((count_down_duration.inSeconds%60).toString(),
                                  style: const TextStyle(
                                      fontFamily: 'Technology',
                                      fontSize: 50,
                                      color: Colors.white
                                  ),),
                              ),

                              Container(
                                child: const Text(
                                  "SEC",
                                  style: TextStyle(
                                    fontFamily: 'Technology',
                                    color: Colors.white,
                                    fontSize: 23,
                                  ),
                                ),
                              ),


                            ],
                          ):
                                  Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.only(top: 50, right: 40),
                                          child: Text(count_down_duration.inHours.toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Technology',
                                                fontSize: 50,
                                                color: Colors.white
                                            ),
                        ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 50, right: 40),
                                          child: const Text(
                                            "HH",
                                            style: TextStyle(
                                              fontFamily: 'Technology',
                                              color: Colors.white,
                                              fontSize: 23,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 50, right: 40),
                                          child:
                                          Text((count_down_duration.inMinutes%60).toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Technology',
                                                fontSize: 50,
                                                color: Colors.white
                                            ),),
                                        ),
                                        Container(
                                          margin: EdgeInsets.only(top: 50, right: 40),
                                          child: const Text(
                                            "min",
                                            style: TextStyle(
                                              fontFamily: 'Technology',
                                              color: Colors.white,
                                              fontSize: 23,
                                            ),
                                          ),
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(top: 50, right: 30),
                                          child:
                                          Text((count_down_duration.inSeconds%60).toString(),
                                            style: const TextStyle(
                                                fontFamily: 'Technology',
                                                fontSize: 50,
                                                color: Colors.white
                                            ),),
                                        ),

                                        Container(
                                          margin: EdgeInsets.only(top: 50),
                                          child: const Text(
                                            "SEC",
                                            style: TextStyle(
                                              fontFamily: 'Technology',
                                              color: Colors.white,
                                              fontSize: 23,
                                            ),
                                          ),
                                        ),
                                      ]
                                  ),
                        ),

                      ],
                    ),

                  ),
              Container(
                margin: EdgeInsets.only(top: 185),
                child: Row(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 20, left: 50),
                    child: Row(
                      children: <Widget>[
                        FloatingActionButton.large(
                          onPressed: (){
                            setState(() {
                              isPushed = 0;
                              resetTimer();
                            });
                          },
                          backgroundColor: Color(0xFF2D2F41),
                          child: Text(
                            "CANCLE",
                            style: TextStyle(
                                fontFamily: 'Technology',
                                fontSize: 35,
                                color: isPushed == 0?
                                Colors.blueGrey.shade400:
                                  Colors.white
                            ),
                          ),
                        )

                      ],
                    ),
                  ),


                  Container(
                    margin: EdgeInsets.only(top: 20, left: 120),
                    child: Row(
                      children: <Widget>[
                        FloatingActionButton.large(
                          onPressed: isPushed == 0?
                              (){
                            setState(() {
                              isPushed = 2;
                              count_down_duration = Duration(hours: hour, minutes: minuite, seconds: second);
                              startTimer();

                              // isPaused = false;
                            });
                          }: isPushed == 2?
                              (){setState(() {
                                isPushed = 3;
                                stopTimer();
                                // startTimer();

                                // isPaused = true;
                            }
                            );
                            }:
                              (){setState(() {
                            isPushed = 2;
                            startTimer();
                            // isPaused = true;
                          }
                          );
                          }

                          ,
                          backgroundColor: isPushed == 0?
                          Colors.green.shade900:
                              isPushed == 2?
                              Colors.orange.shade600:
                              Colors.green.shade900
                            ,
                          child: isPushed == 0?
                          Text(
                            "START",
                            style: TextStyle(
                                fontFamily: 'Technology',
                                fontSize: 35,
                                color: Colors.greenAccent.shade400
                            ),
                          ):
                              isPushed ==2?
                              const Text(
                                  "PAUSE",
                                  style: TextStyle(
                                    fontFamily: 'Technology',
                                    fontSize: 35,
                                    color: Color(0xFFFFE082),
                                  )
                              ):
                              const Text(
                                  "CONTINUE",
                                  style: TextStyle(
                                    fontFamily: 'Technology',
                                    fontSize: 25,
                                    color: Colors.greenAccent,
                                  )
                              )

                        ),

                      ],
                    ),
                  )


                ],
              ),)



            ],
          ),

        )
    );
  }

}
//https://medium.com/@mibcoder/keep-state-of-widgets-with-bottom-navigation-bar-in-flutter-bb732214bd11 << read for save state