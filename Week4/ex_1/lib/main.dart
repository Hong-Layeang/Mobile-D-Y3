import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Scaffold Text Exercise',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // light pink-ish background to match the mockup feel
        backgroundColor: Colors.pink[50],
        body: const Center(
          child: Text(
            'Hello my name is Ronan!',
            style: TextStyle(
              color: Colors.orange,
              fontSize: 50,
            ),
          ),
        ),
      ),
    );
  }
}
