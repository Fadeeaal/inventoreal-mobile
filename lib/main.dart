import 'package:flutter/material.dart';
import 'package:inventoreal_mobile/menu.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'InventoReal',
      theme: ThemeData(
        // Tema aplikasi
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.black),
        useMaterial3: true,
      ),
      home: MyHomePage(),
    );
  }
}
