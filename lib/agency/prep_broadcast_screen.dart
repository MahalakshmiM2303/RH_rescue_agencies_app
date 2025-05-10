import 'package:flutter/material.dart';

class PrepBroadcastScreen extends StatelessWidget {
  const PrepBroadcastScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Prep & Broadcast")),
      body: const Center(child: Text("Send Tips or Alerts")),
    );
  }
}
