class Weather {
  final double temperature;
  final String conditions;
  final double humidity;
  final double windSpeed;
  final String iconCode;

  Weather({
    required this.temperature,
    required this.conditions,
    required this.humidity,
    required this.windSpeed,
    required this.iconCode,
  });

  String get weatherIconUrl {
    return 'https://openweathermap.org/img/w/$iconCode.png';
  }
}
