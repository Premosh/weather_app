import 'dart:js';

import 'package:flutter/material.dart';
import 'package:flutter_project/login_page.dart';
import 'package:flutter_project/register_page.dart';
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
      '/login': (context) => Login(),
      '/register': (context) => Register(),
      '/getStarted': (context) => GetStarted(),
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
  int _currentIndex = 0;
  final pages = {
    Login(),
  };

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (updatedIndex) {
          setState(() {
            _currentIndex = updatedIndex;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: 'Dashboard'),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Top Picks'),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile'),
        ],
      ),
      body: pages.elementAt(_currentIndex),
    );
  }
}
