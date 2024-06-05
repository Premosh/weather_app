import 'package:flutter/material.dart';
import 'package:flutter_project/controller/global_controller.dart';
import 'package:flutter_project/widgets/currentWeather.dart';
import 'package:flutter_project/widgets/header.dart';
import 'package:get/get.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  //call global_controller
  final GlobalController globalController = Get.put(GlobalController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Obx(() => globalController.checkLoading().isTrue
            ? Center(
                child: CircularProgressIndicator(),
              )
            : ListView(
                scrollDirection: Axis.vertical,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Header(),
                  //for our current temperature
                  CurrentWeather(weatherDataCurrent: globalController.getWeatherData().getCurrentWeather(),),
                ],
              )),
      ),
    );
  }
}
