import 'package:flutter/material.dart';
import 'splash_page_widget.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Chromatix',
      debugShowCheckedModeBanner: false, // Esto quita la cinta roja de "Debug"
      home: const SplashPageWidget(), // Así de simple, sin parámetros extra
    );
  }
}
