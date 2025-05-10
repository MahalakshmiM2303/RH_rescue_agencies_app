import 'package:flutter/material.dart';
import 'agency/home_screen.dart'; // import your home screen

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rescue Agency App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const AgencyHomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
