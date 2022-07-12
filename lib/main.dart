import 'package:flutter/material.dart';
import 'homePage.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(SuperMario());
  SystemChrome.setPreferredOrientations([DeviceOrientation.landscapeLeft]);
}

class SuperMario extends StatelessWidget {
  const SuperMario({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage());
  }
}

