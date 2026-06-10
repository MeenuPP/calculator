import 'package:calculator/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Calculator extends StatelessWidget {
  const Calculator({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(seconds: 3),(){
      Navigator.push(context, MaterialPageRoute(builder:(context) => Home(),));
  },);
    return Scaffold(body: Center(child: Lottie.asset("assets/splash.json"),),);
  }
}