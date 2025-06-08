import 'package:flutter/material.dart';

class EmptyCartPage extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  const EmptyCartPage({
    super.key,
    required this.title,
    required this.subtitle,
    required this.image,
  });

  @override
  State<EmptyCartPage> createState() => _EmptyCartPageState();
}

class _EmptyCartPageState extends State<EmptyCartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                widget.image, // Placeholder, use your cart icon image
                height: 120,
                width: 120,
              ),
              const SizedBox(height: 24),
              Text(
                widget.title,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 8),
              Text(
                widget.subtitle,
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: Colors.black54),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
