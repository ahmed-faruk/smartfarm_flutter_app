import 'package:flutter/material.dart';
import 'package:smartfarm_flutter_app/models/weather.dart';
import 'package:smartfarm_flutter_app/services/weather_service.dart';
import 'package:geolocator/geolocator.dart';
import 'package:animate_do/animate_do.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late WeatherService _weatherService;
  late Weather _currentWeather;
  late Position _currentPosition;
  bool _locationServiceEnabled = false;
  bool _internetConnected = true;

  @override
  void initState() {
    super.initState();
    _weatherService = WeatherService();
    _getLocationAndWeather();
  }

  Future<void> _getLocationAndWeather() async {
    bool locationServiceEnabled = await Geolocator.isLocationServiceEnabled();
    setState(() {
      _locationServiceEnabled = locationServiceEnabled;
    });

    if (!locationServiceEnabled) {
      return;
    }

    Position currentPosition = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _currentPosition = currentPosition;
    });

    try {
      Weather currentWeather = await _weatherService.getCurrentWeather(
          _currentPosition.latitude, _currentPosition.longitude);
      setState(() {
        _currentWeather = currentWeather;
      });
    } catch (e) {
      print('Failed to fetch current weather: $e');
      // Handle weather fetch failure
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Handle notifications
            },
          ),
          IconButton(
            icon: Icon(Icons.location_on),
            onPressed: () {
              _getLocationAndWeather();
            },
          ),
        ],
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              child: Text('User Profile'),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: Text('Settings'),
              onTap: () {
                // Handle settings
              },
            ),
            ListTile(
              title: Text('Profile'),
              onTap: () {
                // Handle profile
              },
            ),
          ],
        ),
      ),
      body: _locationServiceEnabled
          ? _internetConnected
          ? _currentWeather != null
          ? Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            'Current Weather',
            style: TextStyle(fontSize: 20),
          ),
          Text(
            '${_currentWeather.temperature} °C',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            '${_currentWeather.conditions}',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Humidity: ${_currentWeather.humidity}%',
            style: TextStyle(fontSize: 18),
          ),
          Text(
            'Wind Speed: ${_currentWeather.windSpeed} m/s',
            style: TextStyle(fontSize: 18),
          ),
        ],
      )
          : CircularProgressIndicator()
          : Text(
          'Please check your internet connection and try again.')
          : Text('Please enable location services to get weather data.'),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Handle floating action button
        },
        child: Icon(Icons.add),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {
                // Navigate to home
              },
            ),
            IconButton(
              icon: Icon(Icons.add_circle),
              onPressed: () {
                // Navigate to add crop
              },
            ),
            IconButton(
              icon: Icon(Icons.view_list),
              onPressed: () {
                // Navigate to manage crops
              },
            ),
            IconButton(
              icon: Icon(Icons.settings),
              onPressed: () {
                // Navigate to settings
              },
            ),
          ],
        ),
      ),
    );
  }
}
