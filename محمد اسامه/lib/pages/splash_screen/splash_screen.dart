import 'dart:async';
import 'package:flutter/material.dart';
import 'package:untitled1/pages/onBoarding_screens/onboarding_screens.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "splash";

  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 3), () {
       Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => OnBoarding()),
              );
     // Navigator.pushReplacementNamed(context, OnBoarding.routeName);
    });
    super.initState();
  }

  @override
  
Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF0EDEA),
      body: ListView(
        children: [
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('assets/images/first.png'), 
              ],
            ),
          ),
        ],
      ),
    );
  }
}
