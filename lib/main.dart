import 'package:flutter/material.dart';
import 'package:flutter_project/ui/home.dart';
import 'package:flutter_project/ui/getstarted.dart';
import 'package:flutter_project/ui/splashscreen.dart';

void main() {
  runApp(MaterialApp(
    title: 'Zorooo',
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
      useMaterial3: false,
    ),
    routes: {
      '/': (context) => Splash(),
      '/getStarted': (context) => GetStarted(),
      '/home': (context) => Home(),
    },
    initialRoute: '/',
  ));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
