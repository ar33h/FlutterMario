import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:super_mario/button.dart';
import 'package:super_mario/jumpingMario.dart';
import 'package:super_mario/mario.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  static double marioX = 0;
  static double marioY = 1;
  double time = 0;
  double height = 0;
  double initialHeight = marioY;
  String direction = 'right';

  bool midrun = false;
  bool midjump = false;

  var gameFont = GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.white, fontSize: 22));

  void preJump(){
    time = 0;
    initialHeight = marioY;
  }

  void jump(){
    midjump = true;
    preJump();
    Timer.periodic(Duration(milliseconds: 50), (timer) { 
      time = time + 0.06;
      height = -5.7 * time * time + 5 * time;

      if (initialHeight - height > 1) {
        midjump = false;
        setState(() {
          marioY = 1;
        }); 
        timer.cancel();
      } 
      else {
        setState(() {
        marioY = initialHeight - height;
      });
      }
    });
  }

  void moveRight() {
    direction = "right";
    midrun = !midrun;

    Timer.periodic(Duration(milliseconds: 50), (timer) { 
      if(MyButton().buttonHoldByUser() == true) {
        setState(() {
          marioX += 0.02;
          midrun = !midrun;  
        });
      }
      else { 
        timer.cancel();
      }
    });
  }


  void moveLeft() {
    direction = "left";
    
    Timer.periodic(Duration(milliseconds: 50), (timer) { 
      if(MyButton().buttonHoldByUser() == true) {
        setState(() {
          marioX -= 0.02;
          midrun = !midrun;  
        });
      }
      else { 
        timer.cancel();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 4,
            child: Stack(
              children: [
                Container(
              color: Colors.blue,
              child: AnimatedContainer(
                alignment: Alignment(marioX, marioY),
                duration: Duration(milliseconds: 0),
                child: midjump ? JumpingMario(direction: direction,) :
                MyMario(direction: direction, midrun: midrun,),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(top: 63.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                    Text("FLUTTER MARIO", style: gameFont,),
                    SizedBox(height: 12,),
                    Text("github.com/ar33h", style: GoogleFonts.pressStart2p(textStyle: TextStyle(color: Colors.white, fontSize: 15)),
                  )]
                  )
                ]
              ),
            )
              ],
            )
          ),


          Container(
            color: Colors.green,
            height: 10,
          ),
        
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.brown,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  MyButton(
                    child: Icon(Icons.arrow_back, color: Colors.white,),
                    function: moveLeft,
                  ),

                  MyButton(
                    child: Icon(Icons.arrow_upward, color: Colors.white,),
                    function: jump,
                  ),

                  MyButton(
                    child: Icon(Icons.arrow_forward, color: Colors.white,),
                    function: moveRight,
                  ),
              ],)
            ),
          ),

        ],
      )
    );
  }
}