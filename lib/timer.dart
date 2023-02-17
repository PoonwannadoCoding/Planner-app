import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:numberpicker/numberpicker.dart';

class TimerScreen extends StatefulWidget {
  const TimerScreen({Key? key}) : super(key: key);

  @override
  State<TimerScreen> createState() => timerPageState();
}

class timerPageState extends State<TimerScreen>{
  int hour = 0;
  int minuite = 0;
  int second = 0;
  bool isPushed = true;


  static const TextStyle optionStyle =
  TextStyle(fontSize: 30, fontWeight: FontWeight.bold);



  @override
  Widget build(BuildContext context) {
    const double size_of_icon = 40;




    return Scaffold(
      backgroundColor: Color(0xFF2D2F41),


        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
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

                width: 380,
                // height: 150,
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

                  child: Center(
                    child: Column(
                      children: [
                        Container(

                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [

                              Container(

                                child: isPushed?
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
                                    Text(hour.toString(),
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
                                    fontSize: 15,
                                  ),
                                ),
                              ),

                        Container(
                                child: isPushed?
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
                                Text(minuite.toString(),
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
                                    fontSize: 15,
                                  ),
                                ),
                              ),


                              Container(


                                child: isPushed?
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
                                Text(second.toString(),
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
                                    fontSize: 15,
                                  ),
                                ),
                              ),


                            ],
                          ),
                        ),

                      ],
                    ),

                  ),

              ),

              Container(
                child: Row(
                  children: <Widget>[
                    IconButton(
                        onPressed: (){
                          setState(() {
                            isPushed = false;
                          });
                        },
                        icon: const Icon(Icons.access_time_outlined)
                    )
                  ],
                ),
              )


            ],
          ),

        )
    );
  }

}
//https://medium.com/@mibcoder/keep-state-of-widgets-with-bottom-navigation-bar-in-flutter-bb732214bd11 << read for save state