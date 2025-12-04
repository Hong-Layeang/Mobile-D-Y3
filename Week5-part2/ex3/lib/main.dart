import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

enum Product {
  dart('Dart', 'the best object language', 'asset/dart.png'),
  flutter('Flutter', 'the best mobile widget library', 'asset/flutter.png'),
  firebase('Firebase', 'the best cloud database', 'asset/firebase.png');

  final String title;
  final String description;
  final String assetPath;

  const Product(this.title, this.description, this.assetPath);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Products'),
          backgroundColor: Colors.white,
          foregroundColor: Colors.black87,
          elevation: 0,
        ),
        body: Container(
          color: Colors.blue[300],
          width: double.infinity,
          // ensure this container fills the scaffold body so Column's
          // Expanded children get bounded height constraints
          height: double.infinity,
          child: const Padding(
            padding: EdgeInsets.all(12.0),
            child: Column(
              children: [
                Expanded(
                  child: ProductCard(product: Product.dart),
                ),
                SizedBox(height: 12),
                Expanded(
                  child: ProductCard(product: Product.flutter),
                ),
                SizedBox(height: 12),
                Expanded(
                  child: ProductCard(product: Product.firebase),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ProductCard extends StatelessWidget {
  final Product product;

  const ProductCard({
    super.key,
    required this.product,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      elevation: 4,
      color: Colors.white,
      child: Container(
        // make the card fill the available height so siblings with Expanded
        // divide the space equally
        height: double.infinity,
        padding: const EdgeInsets.all(12),
        width: double.infinity,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                product.assetPath,
                width: 72,
                height: 72,
                fit: BoxFit.contain,
                errorBuilder: (c, o, s) => Container(
                  width: 72,
                  height: 72,
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image_not_supported, size: 36),
                ),
              ),
            ),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    product.title,
                    style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    product.description,
                    style: TextStyle(fontSize: 12, color: Colors.grey.shade600),
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