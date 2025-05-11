
import 'package:flutter/material.dart';

class PrepBroadcastScreen extends StatelessWidget {
  PrepBroadcastScreen({super.key});

  final List<Map<String, String>> tips = [
    {
      'title': 'Flood Safety Tip',
      'content': 'Move to higher ground immediately. Avoid walking or driving through floodwaters.',
      'category': 'Flood',
      'urgency': 'High',
    },
    {
      'title': 'Fire Evacuation',
      'content': 'Have an emergency kit ready. Cover your nose and mouth with a wet cloth while evacuating.',
      'category': 'Fire',
      'urgency': 'High',
    },
    {
      'title': 'Earthquake Safety',
      'content': 'Drop, Cover, and Hold On. Stay away from windows and heavy furniture.',
      'category': 'Earthquake',
      'urgency': 'Medium',
    },
    {
      'title': 'Cyclone Preparedness',
      'content': 'Secure loose outdoor items. Stock up on water, food, and batteries.',
      'category': 'Cyclone',
      'urgency': 'Medium',
    },
    {
      'title': 'Basic Emergency Kit',
      'content': 'Keep water, non-perishable food, flashlight, batteries, and first aid supplies ready.',
      'category': 'General',
      'urgency': 'Low',
    },
  ];

  Color urgencyColor(String urgency) {
    switch (urgency) {
      case 'High':
        return Colors.redAccent;
      case 'Medium':
        return Colors.orangeAccent;
      default:
        return Colors.green;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preparedness Tips"),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: tips.length,
        itemBuilder: (context, index) {
          final tip = tips[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            margin: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(tip['title'] ?? '',
                      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text(tip['content'] ?? ''),
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      Chip(
                        label: Text(tip['category'] ?? 'General'),
                        backgroundColor: Colors.blue.shade100,
                      ),
                      const SizedBox(width: 10),
                      Chip(
                        label: Text("Urgency: ${tip['urgency']}"),
                        backgroundColor: urgencyColor(tip['urgency'] ?? 'Low'),
                        labelStyle: const TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

