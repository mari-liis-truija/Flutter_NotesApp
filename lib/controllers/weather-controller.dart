import 'dart:convert';

import 'package:http/http.dart' as http;

class WeatherController {
  String endpoint = "https://api.open-meteo.com/v1/forecast?latitude=58.36&longitude=26.73&current_weather=true"; // tartu, postman-i url

  Future<String> fetchWeather() async {
    http.Response response = await http.get(Uri.parse(endpoint)); // await, ootame kuni see funktsioon tagastab midagi
    Map<String, dynamic> weather = jsonDecode(response.body); // jsonDecode - teeb stringist map objekti
    String weatherString = weather["current_weather"]["temperature"].toString() +"° C, wind speed: " + weather["current_weather"]["windspeed"].toString() + " m/s";
    return weatherString;

//    return http.get(Uri.parse(endpoint));
  }

}