import 'dart:async';
import 'package:alarmplayer/alarmplayer.dart';
import 'package:flutter/material.dart';
import 'package:lite_rolling_switch/lite_rolling_switch.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';


class TimerPage extends StatefulWidget {
  const TimerPage({super.key});

  @override
  State<TimerPage> createState() => _TimerPageState();
}

class _TimerPageState extends State<TimerPage> {
  double percent=0.0;
  late Timer timer;
  _startTimer(){
    timer=Timer.periodic(Duration(milliseconds: 1000), (_) {
      setState(() {
        percent+=1;
        if(percent>=30){
          timer.cancel();
          percent=0.0;
        }
      });
    });
  }
  Alarmplayer alarmplayer = Alarmplayer();

  bool playing = false;

  void switchPlaying(){
    playing = !playing;
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: Wrap(
        direction: Axis.horizontal,
        children: [
          Container(
            height: size.height,
            width: size.width,
            child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Nom nom:)",style: TextStyle(fontSize: 25,color: Colors.white),),
              Text("You have 10 minutes to eat before the pause.",style: TextStyle(fontSize: 18,color: Colors.white60),),
              Text("focus on eating slowly",style: TextStyle(fontSize: 18,color: Colors.white60),),

              SizedBox(height: 16,),

              Stack(
                children: [
                  Container(
                    width: 320,
                    height: 320,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(170),
                      color: Colors.white60,
                    ),
                  ),
                  Positioned(
                    left:35,right: 35,top: 35,bottom: 35,
                    child: Container(
                      width: 180,
                      height: 180,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(170),
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Positioned(
                    left:5,right: 5,top: 5,bottom: 5,

                    child: Container(
                      width: 160,
                      height: 160,
                      child: CircularPercentIndicator(
                        circularStrokeCap: CircularStrokeCap.round,
                        percent: percent/30,
                        animateFromLastPercent: true,
                        radius: 120,
                        lineWidth: 6,
                        progressColor: Colors.green,
                        center: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          //crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text("$percent",style: TextStyle(fontSize: 50,fontWeight: FontWeight.bold,color: Colors.black),),
                            Text("minutes remaining",style: TextStyle(fontSize: 16,color: Colors.black),)
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              ),
                SizedBox(height: 15,),
              LiteRollingSwitch(
                //initial value
                value: true,
                textOn: 'On',
                textOff: 'Off',
                colorOn: Colors.green,
                colorOff: Colors.red,
                iconOn: Icons.done,
                iconOff: Icons.remove_circle_outline,
                textSize: 16.0,
                onChanged: (bool state) {
                },
                onTap: () async{
                  switchPlaying();
                  alarmplayer.Alarm(
                    url: "Assets/tune/countdown_tick (1).mp3",
                    volume: 0.5,
                    looping: false,
                    callback: switchPlaying,
                  );
                },
                onDoubleTap: (){},
                onSwipe: ()async{
                  switchPlaying();
                  alarmplayer.Alarm(
                    url: "Assets/tune/countdown_tick (1).mp3",
                    volume: 0.5,
                    looping: false,
                    callback: switchPlaying,
                  );
                },
              ),
              SizedBox(height: 15,),

              Container(
                height: 68,width: 340,
                child: ElevatedButton(
                  onPressed: () {
                    _startTimer();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.greenAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),),
                  child:
                  Text("Pause",style: TextStyle(fontSize: 20,color: Colors.black),),
                ),
              ),
              SizedBox(height: 15,),

              Container(
                height: 68,width: 340,
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.white)
                ),
                child: ElevatedButton(
                  onPressed: () {
                    _startTimer();
                  },
                  style: ElevatedButton.styleFrom(
                    primary: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),),
                  child:
                  Text("LETS STOP I'M FULL NOW",style: TextStyle(fontSize: 25,color: Colors.white),),
                ),
              ),
            ],
        ),
          ),
        ],
      ),
    );
  }
}
