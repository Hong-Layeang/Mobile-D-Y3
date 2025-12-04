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
      home: Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Container(
            width: 420,
            color: Colors.grey[300],
            padding: const EdgeInsets.all(16.0),
            child: const Center(
                child: SizedBox(
                  width: 360,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      CustomCard(text: 'OOP', color: Colors.blue),
                      CustomCard(text: 'DART', color: Colors.blue),
                      CustomCard(text: 'FLUTTER', gradientColors: [Colors.blue, Color(0xFF1565C0)],),
                    ],
                  ),
                ),
            ),
          ),
        ),
      ),
    );
  }
}

///
/// Parameters:
/// - [text] (required): label to show.
/// - [color] (optional): solid background color (defaults to [Colors.blue]).
/// - [gradientColors] (optional): if provided, the card will use a left->right
///   linear gradient using these colors instead of a solid color.
class CustomCard extends StatelessWidget {
  final String text;
  final Color? color;
  final List<Color>? gradientColors;

  const CustomCard({
    required this.text,
    this.color,
    this.gradientColors,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
      color: gradientColors == null ? (color ?? Colors.blue) : null,
      gradient: gradientColors == null
          ? null
          : LinearGradient(
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              colors: gradientColors!,
            ),
      borderRadius: BorderRadius.circular(30.0),
    );

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10.0),
      padding: const EdgeInsets.symmetric(vertical: 12.0),
      decoration: decoration,
      alignment: Alignment.center,
      child: Text(
        text,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 26,
          fontWeight: FontWeight.w700,
          letterSpacing: 1.2,
        ),
      ),
    );
  }
}
