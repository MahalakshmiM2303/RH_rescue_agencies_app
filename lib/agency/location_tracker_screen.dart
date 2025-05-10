import 'package:flutter/material.dart';

class LocationTrackerScreen extends StatelessWidget {
  const LocationTrackerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Location Tracker")),
      body: const Center(child: Text("Track Active Teams")),
    );
  }
}
