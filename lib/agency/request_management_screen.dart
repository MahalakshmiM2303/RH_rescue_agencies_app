import 'package:flutter/material.dart';

class RequestManagementScreen extends StatelessWidget {
  const RequestManagementScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Sample data — you can later replace with Firebase/REST API
    final List<Map<String, String>> requests = [
      {
        'type': 'Flood Rescue',
        'location': 'Sector 9, Riverdale',
        'timestamp': '10 May, 3:45 PM',
        'status': 'Pending',
        'description': 'Family stranded on rooftop with 2 kids.'
      },
      {
        'type': 'Medical Emergency',
        'location': 'Old Town, Block A',
        'timestamp': '10 May, 2:10 PM',
        'status': 'In Progress',
        'description': 'Person collapsed during evacuation.'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Requests'),
        backgroundColor: Colors.redAccent,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(12),
        itemCount: requests.length,
        itemBuilder: (context, index) {
          final req = requests[index];
          return Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 4,
            margin: const EdgeInsets.symmetric(vertical: 8),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(req['type']!, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                  const SizedBox(height: 6),
                  Text("📍 ${req['location']}"),
                  Text("🕒 ${req['timestamp']}"),
                  const SizedBox(height: 8),
                  Text("📝 ${req['description']}"),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Chip(
                        label: Text(req['status']!),
                        backgroundColor: req['status'] == 'Resolved'
                            ? Colors.green[300]
                            : (req['status'] == 'In Progress'
                                ? Colors.orange[300]
                                : Colors.red[300]),
                      ),
                      Row(
                        children: [
                          IconButton(
                            icon: const Icon(Icons.map),
                            onPressed: () {
                              // Map viewing logic (optional)
                            },
                          ),
                          IconButton(
                            icon: const Icon(Icons.check_circle),
                            onPressed: () {
                              // Handle status update (optional)
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(content: Text("Marked as Resolved")),
                              );
                            },
                          ),
                        ],
                      )
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

