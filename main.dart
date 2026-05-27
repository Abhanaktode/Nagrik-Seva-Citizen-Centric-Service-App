import 'package:flutter/material.dart';
import 'package:sycs/prac1.dart';
import 'package:sycs/nagrik_seva_app/logo.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: LogoScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}


