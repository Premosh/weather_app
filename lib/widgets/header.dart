import 'package:flutter/material.dart';
import 'package:flutter_project/controller/global_controller.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class Header extends StatefulWidget {
  const Header({super.key});

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  String city = '';
  String date=DateFormat("yMMMMd").format(DateTime.now());
  late GlobalController globalController;

  @override
  void initState() {
    super.initState();
    globalController = Get.find<GlobalController>();
    _updateAddress();
  }

  void _updateAddress() {
    final lat = globalController.getLatitude().value;
    final long = globalController.getLongitude().value;
    print({lat, long});
    getAddress(lat, long);
  }

  Future<void> getAddress(double lat, double long) async {
    try {
      List<Placemark> placemarks = await placemarkFromCoordinates(lat, long);
      if (placemarks.isNotEmpty) {
        Placemark place = placemarks[0];
        setState(() {
          city = place.locality ?? 'Unknown location';
        });
      }
    } catch (e) {
      setState(() {
        city = 'Error fetching location';
      });
      // Optionally, log the error or show a message to the user
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20),
            alignment: Alignment.topLeft,
            child: Text(
              city,
              style: TextStyle(fontSize: 35, height: 2),
            )
        ),
        Container(
            margin: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
            alignment: Alignment.topLeft,
            child: Text(
              date,
              style: TextStyle(fontSize: 14, color: Colors.grey, height: 1.5),
            )
        ),
      ],
    );
  }
}
