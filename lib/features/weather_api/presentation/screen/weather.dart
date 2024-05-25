import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:remote_kitchen_technical_assignment/features/weather_api/data/weather_service.dart';
import 'package:remote_kitchen_technical_assignment/features/weather_api/model/weather_model.dart';

class Weather extends StatefulWidget {
  const Weather({super.key});

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  final weatherService =
      WeatherService(apiKey: 'f03b7be340b42de0975202d189534268');
  WeatherModel ? _weatherModel;

  _fetchWeather() async {
    String cityName = await weatherService.getCurrentCity();
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    String lattutude = position.latitude.toString();
    String longitude = position.longitude.toString();

    try {
      final weather =
          await weatherService.getWeather(cityName, lattutude, longitude);
      print('this is weather from weather api - ${weather}');
      setState(() {
        _weatherModel = weather;
      });
    } catch (e) {
      print("there's been an error ${e}!");
    }
  }

  @override
  void initState() {
    super.initState();
    _fetchWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: Text('this is weather page ${_weatherModel?.cityName ?? 'demo name'}'),
    );
  }
}
