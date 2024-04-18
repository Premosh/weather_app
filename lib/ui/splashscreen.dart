import 'dart:async';
import 'package:flutter/material.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState(){
    // T000: implement initState
    Timer(Duration(seconds: 10),()=> Navigator.of(context).pushReplacementNamed('/getStarted'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff004467),
      body: Center(
        child: ColorFiltered(
          colorFilter: ColorFilter.mode(
            Colors.black.withOpacity(0.5), // Adjust opacity as needed
            BlendMode.srcOver, // Blend mode to darken the GIF
          ),
          child: Image.asset('assets/images/wet-rain.gif'),
        ),
      ),
    );
  }
}
