import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:smartfarm_flutter_app/models/weather.dart';

class WeatherService {
  final String apiKey = 'aa910fd11cef3b1a877494b88424ea8d';
  final String baseUrl = 'https://api.openweathermap.org/data/2.5';

  Future<Weather> getCurrentWeather(double latitude, double longitude) async {
    final response = await http.get(
        '$baseUrl/weather?lat=$latitude&lon=$longitude&appid=$apiKey&units=metric'
        as Uri);
    if (response.statusCode == 200) {
      Map<String, dynamic> weatherData = json.decode(response.body);
      return Weather(
        temperature: weatherData['main']['temp'],
        conditions: weatherData['weather'][0]['main'],
        humidity: weatherData['main']['humidity'].toDouble(),
        windSpeed: weatherData['wind']['speed'].toDouble(),
        iconCode: weatherData['weather'][0]['icon'],
      );
    } else {
      throw Exception('Failed to fetch current weather data');
    }
  }

  Future<List<Weather>> getForecastWeather(double latitude, double longitude) async {
    final response = await http.get('$baseUrl/forecast?lat=$latitude&lon=$longitude&appid=$apiKey' as Uri);

    if (response.statusCode == 200) {
      Map<String, dynamic> forecastData = json.decode(response.body);
      List<dynamic> list = forecastData['list'];
      List<Weather> forecastWeather = [];

      for (var item in list) {
        forecastWeather.add(Weather(
          temperature: (item['main']['temp'] - 273.15), // Convert Kelvin to Celsius
          conditions: item['weather'][0]['main'],
          humidity: item['main']['humidity'].toDouble(),
          windSpeed: item['wind']['speed'].toDouble(),
          iconCode: item['weather'][0]['icon'],
        ));
      }

      return forecastWeather;
    } else {
      throw Exception('Failed to fetch forecast weather data');
    }
  }
}
