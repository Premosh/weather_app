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
    Timer(Duration(seconds: 10),()=> Navigator.of(context).pushReplacementNamed('/home'));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff004467),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
              child: SizedBox(
                height: 300,
                width: 300,
                  child: Image.asset('assets/images/wet-rain.gif')
              ),
            ),
          SizedBox(
            height: 40,
          ),
          CircularProgressIndicator(color: Colors.white,),
        ],
      ),
    );
  }
}
