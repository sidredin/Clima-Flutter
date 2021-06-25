import 'dart:convert';

import '../services/location.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {
  @override
  void initState() {
    super.initState();
  }

  void getLocation() async {
    var location = Location();
    await location.getCurrentLocation();

    print('latitude: ${location.latitude}');
    print('longitude: ${location.longitude}');
  }

  void getData() async {
    http.Response response = await http.get(
      Uri.parse(
          'https://api.openweathermap.org/data/2.5/weather?lat=42.9899&lon=47.4721&appid=48d8be06dea65575b0910a1e00cf4c69&units=metric'),
    );

    if (response.statusCode == 200) {
      var data = response.body;

      var decodedData = jsonDecode(data);

      double temperature = decodedData['main']['temp'];
      int condition = decodedData['weather'][0]['id'];
      String cityName = decodedData['name'];

      print(cityName);
      print(cityName.runtimeType);
    } else {
      print(response.statusCode);
    }
  }

  @override
  Widget build(BuildContext context) {
    getData();
    return Scaffold();
  }
}
