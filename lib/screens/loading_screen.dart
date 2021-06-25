import '../services/location.dart';
import 'package:flutter/material.dart';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async {
    var location = Location();
    await location.getCurrentLocation();

    print('latitude: ${location.latitude}');
    print('longitude: ${location.longitude}');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold();
  }
}
