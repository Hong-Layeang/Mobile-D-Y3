import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Seasons App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const SeasonsScreen(),
    );
  }
}

class SeasonsScreen extends StatelessWidget {
  const SeasonsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'HOMEWORK',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Container(
            padding: const EdgeInsets.all(30.0),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(20),
            ),
            child: const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.person,
                  size: 50,
                ),
                SizedBox(width: 40),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      'SEASONS',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        SeasonCard(
                          country: 'FRANCE',
                          seasonImages: [
                            'assets/france/winter.png',
                            'assets/france/spring.png',
                            'assets/france/summer.png',
                            'assets/france/autumn.png',
                          ],
                        ),
                        SizedBox(width: 20),
                        SeasonCard(
                          country: 'CAMBODIA',
                          seasonImages: [
                            'assets/cambodia/dry.png',
                            'assets/cambodia/rainy.jpg',
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SeasonCard extends StatefulWidget {
  final String country;
  final List<String> seasonImages;

  const SeasonCard({
    super.key,
    required this.country,
    required this.seasonImages,
  });

  @override
  State<SeasonCard> createState() => _SeasonCardState();
}

class _SeasonCardState extends State<SeasonCard> {
  int currentSeasonIndex = 0;

  void _nextSeason() {
    setState(() {
      currentSeasonIndex = (currentSeasonIndex + 1) % widget.seasonImages.length;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _nextSeason,
      child: Container(
        width: 200,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black, width: 3),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(7),
                topRight: Radius.circular(7),
              ),
              child: Image.asset(
                widget.seasonImages[currentSeasonIndex],
                width: 200,
                height: 250,
                fit: BoxFit.cover,
              ),
            ),
            Container(
              width: 200,
              padding: const EdgeInsets.symmetric(vertical: 15),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(7),
                  bottomRight: Radius.circular(7),
                ),
              ),
              child: Center(
                child: Text(
                  widget.country,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
