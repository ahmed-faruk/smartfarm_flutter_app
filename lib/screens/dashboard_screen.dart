import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:smartfarm_flutter_app/services/weather_service.dart';
import 'package:smartfarm_flutter_app/models/weather.dart';
import 'package:geolocator/geolocator.dart';
import 'package:animate_do/animate_do.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late Weather _currentWeather;
  bool _locationServiceEnabled = false;
  bool _internetConnection = false;

  @override
  void initState() {
    super.initState();
    _getLocationAndWeather();
  }

  Future<void> _getLocationAndWeather() async {
    // Check if location services are enabled
    _locationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!_locationServiceEnabled) {
      return;
    }

    // Check internet connection
    var connectivityResult = await (Connectivity().checkConnectivity());
    _internetConnection = connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi;

    if (!_internetConnection) {
      return;
    }

    // Get current position (latitude and longitude)
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    // Fetch current weather based on user's location
    WeatherService weatherService = WeatherService();
    Weather weather = await weatherService.getCurrentWeather(
        position.latitude, position.longitude);

    setState(() {
      _currentWeather = weather;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notification button press
            },
          ),
          IconButton(
            icon: Icon(Icons.refresh),
            onPressed: () {
              _getLocationAndWeather();
            },
          ),
        ],
      ),
      body: Center(
        child: _currentWeather != null
            ? Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'Current Temperature: ${_currentWeather.temperature}°C',
            ),
            Text('Conditions: ${_currentWeather.conditions}'),
            Text('Humidity: ${_currentWeather.humidity}%'),
            Text('Wind Speed: ${_currentWeather.windSpeed} m/s'),
          ],
        )
            : _locationServiceEnabled
            ? _internetConnection
            ? CircularProgressIndicator()
            : Text('No internet connection')
            : Text('Location services disabled'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Add your action here
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 50.0,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              IconButton(
                icon: Icon(Icons.home),
                onPressed: () {
                  // Navigate to Home screen
                },
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: () {
                  // Navigate to Add Crop screen
                },
              ),
              IconButton(
                icon: Icon(Icons.manage_accounts),
                onPressed: () {
                  // Navigate to Manage Crops screen
                },
              ),
              IconButton(
                icon: Icon(Icons.settings),
                onPressed: () {
                  // Navigate to Settings screen
                },
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
