import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: WeatherForecastScreen(),
    );
  }
}

class WeatherForecastScreen extends StatelessWidget {
  const WeatherForecastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[200],
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: const [
            WeatherCard(
              cityName: 'PhnomPenh',
              minTemp: 10.0,
              maxTemp: 30.0,
              currentTemp: 12.2,
              weatherIcon: 'assets/cloudy.png',
              gradientColors: [Color(0xFFB39DDB), Color(0xFF7E57C2)],
            ),
            SizedBox(height: 16),
            WeatherCard(
              cityName: 'Paris',
              minTemp: 10.0,
              maxTemp: 40.0,
              currentTemp: 22.2,
              weatherIcon: 'assets/sunnyCloudy.png',
              gradientColors: [Color(0xFF80CBC4), Color(0xFF4DB6AC)],
            ),
            SizedBox(height: 16),
            WeatherCard(
              cityName: 'Rome',
              minTemp: 10.0,
              maxTemp: 40.0,
              currentTemp: 45.2,
              weatherIcon: 'assets/sunny.png',
              gradientColors: [Color(0xFFEF9A9A), Color(0xFFE57373)],
            ),
            SizedBox(height: 16),
            WeatherCard(
              cityName: 'Toulouse',
              minTemp: 10.0,
              maxTemp: 40.0,
              currentTemp: 45.2,
              weatherIcon: 'assets/veryCloudy.png',
              gradientColors: [Color(0xFFFFCC80), Color(0xFFFFB74D)],
            ),
          ],
        ),
      ),
    );
  }
}

class WeatherCard extends StatelessWidget {
  final String cityName;
  final double minTemp;
  final double maxTemp;
  final double currentTemp;
  final String weatherIcon;
  final List<Color> gradientColors;

  const WeatherCard({
    super.key,
    required this.cityName,
    required this.minTemp,
    required this.maxTemp,
    required this.currentTemp,
    required this.weatherIcon,
    required this.gradientColors,
  });

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: Colors.transparent,
      elevation: 8,
      shadowColor: Colors.black.withOpacity(0.3),
      borderRadius: BorderRadius.circular(24),
      child: Container(
        height: 140,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: gradientColors,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(24),
        ),
        child: Stack(
          children: [
            Positioned(
              right: -30,
              top: -20,
              child: Container(
                width: 120,
                height: 180,
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.1),
                  shape: BoxShape.circle,
                ),
              ),
            ),
            // Main content
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Row(
                children: [
                  Container(
                    width: 70,
                    height: 70,
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Image.asset(
                        weatherIcon,
                        fit: BoxFit.contain,
                      ),
                    ),
                  ),
                  const SizedBox(width: 20),
                  // City name and temperature info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          cityName,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          'Min ${minTemp.toStringAsFixed(1)}°C',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                        Text(
                          'Max ${maxTemp.toStringAsFixed(1)}°C',
                          style: TextStyle(
                            color: Colors.white.withOpacity(0.9),
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Current temperature
                  Text(
                    '${currentTemp.toStringAsFixed(1)}°C',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}