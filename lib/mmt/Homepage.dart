import 'dart:async';

import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Hometimer extends StatefulWidget {
  const Hometimer({super.key});

  @override
  State<Hometimer> createState() => _HometimerState();
}

class _HometimerState extends State<Hometimer> {
  double percent=0.0;
   late Timer timer;
  _startTimer(){
    timer=Timer.periodic(Duration(seconds: 60), (_) {
     setState(() {
       percent+=1;
       if(percent>=60){
         timer.cancel();
         percent=0.0;
       }
     });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.black,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(padding: EdgeInsets.only(top: 25),
                child: Text("Timer"),

              ),
              Expanded(
                child: CircularPercentIndicator(
                  circularStrokeCap: CircularStrokeCap.round,
                  percent: percent/60,
                  animateFromLastPercent: true,
                  radius: 250,
                  lineWidth: 20,
                  progressColor: Colors.green,
                  center: Text("$percent",style: TextStyle(fontSize: 80,fontWeight: FontWeight.bold,color: Colors.white),),
                ),
              ),
              SizedBox(height: 20,),
              Center(
                child: Container(
                  height: 53,width: 380,
                  child: ElevatedButton(
                    onPressed: () {
                      _startTimer();
                    },
                    style: ElevatedButton.styleFrom(
                      primary: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100),
                      ),),
                    child:
                    Text("Login",style: TextStyle(fontSize: 20),),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
