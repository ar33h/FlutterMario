import 'dart:math';

import 'package:flutter/material.dart';

class JumpingMario extends StatelessWidget {
  
  final direction;

  JumpingMario({this.direction});
  



  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
      width: 50,
      height: 50,
      child: Image.asset('lib/assets/images/mario_jumping.png'),
    );
    }
    
    else { 
      return Transform(
        transform: Matrix4.rotationY(pi),
        alignment: Alignment.center,
        child: Container(
      width: 50,
      height: 50,
      child: Image.asset('lib/assets/images/mario_jumping.png'),
    )
      );
    }
  }
}