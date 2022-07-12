import 'dart:math';

import 'package:flutter/material.dart';

class MyMario extends StatelessWidget {

  final direction;
  final midrun;
  final midjump;

  MyMario({this.direction, this.midrun, this.midjump});

  @override
  Widget build(BuildContext context) {
    if (direction == 'right') {
      return Container(
        width: 50,
        height: 50,
        child: midrun ? Image.asset('lib/assets/images/mario_standing.png') :
        Image.asset('lib/assets/images/mario_running.png')
      );
    }

    else {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.rotationY(pi),
        child: Container(
          width: 50,
          height: 50,
          child: midrun ? Image.asset('lib/assets/images/mario_standing.png') :
        Image.asset('lib/assets/images/mario_running.png')
        )
      );
    };
  }
}