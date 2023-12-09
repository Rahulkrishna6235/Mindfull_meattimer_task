import 'package:flutter/material.dart';
import 'package:mindful_meal_timer/mmt/page2.dart';
import 'package:mindful_meal_timer/mmt/page3.dart';
import 'package:mindful_meal_timer/mmt/timer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class TimerPagechange extends StatefulWidget {
  const TimerPagechange({super.key});

  @override
  State<TimerPagechange> createState() => _TimerPagechangeState();
}

class _TimerPagechangeState extends State<TimerPagechange> {
  final _controller=PageController();
  @override
  Widget build(BuildContext context) {
    final Size size=MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        leading: IconButton(onPressed: (){}, icon: Icon(Icons.arrow_back,color: Colors.white,)),
        title: Text("Mindful Meat Timer",style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,

      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
         SmoothPageIndicator(
           controller: _controller,
           count: 3,
           effect: SwapEffect(
             activeDotColor: Colors.white,
             dotColor: Colors.green,
dotHeight: 20,
           dotWidth: 20
           ),
         )
            ,SizedBox(
              height: size.height,
              child: PageView(
                controller: _controller,
                children: [
                  TimerPage(),
                  Page2(),
                  TimerPage3(),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
