import 'package:clima/services/networking.dart';

import '../services/location.dart';
import 'package:flutter/material.dart';

const apiKey = '48d8be06dea65575b0910a1e00cf4c69';

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  double latitude;
  double longitude;

  @override
  void initState() {
    super.initState();
  }

  void getLocationData() async {
    var location = Location();
    await location.getCurrentLocation();

    latitude = location.latitude;
    longitude = location.longitude;

    NetworkHelper networkHelper = NetworkHelper('https://api.openweathermap.org/data/2.5/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric');

    var weatherData = await networkHelper.getData();
  }

  @override
  Widget build(BuildContext context) {
    getLocationData();
    return Scaffold();
  }
}
