import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  
  final child;
  final function;
  static bool buttonHold = false;

  MyButton({this.child, this.function});
  
  bool buttonHoldByUser() {
    return buttonHold;
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: (details) {
        buttonHold = true;
        function();
      },

      onTapUp: (detils) {
        buttonHold = false;
      },
      child: ClipRRect(
        borderRadius: BorderRadius.circular(15),
        child: Container(
          padding: EdgeInsets.all(8),
          color: Colors.brown[300],
          child: child,
        )
      ),
    );
    
  }
}