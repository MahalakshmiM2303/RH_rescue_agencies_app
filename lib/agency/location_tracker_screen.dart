import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class LocationTrackerScreen extends StatefulWidget {
  const LocationTrackerScreen({super.key});

  @override
  State<LocationTrackerScreen> createState() => _LocationTrackerScreenState();
}

class _LocationTrackerScreenState extends State<LocationTrackerScreen> {
  double agencyLat = 12.9716;
  double agencyLng = 77.5946;

  final _userLatController = TextEditingController();
  final _userLngController = TextEditingController();

  void _openMap(double lat, double lng) async {
    final url = 'https://www.google.com/maps/search/?api=1&query=$lat,$lng';
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Could not open the map')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Location Tracker'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Your Current Location",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),
            Text("Latitude: $agencyLat"),
            Text("Longitude: $agencyLng"),
            const SizedBox(height: 12),
            ElevatedButton(
              onPressed: () => _openMap(agencyLat, agencyLng),
              child: const Text("View My Location on Map"),
            ),
            const Divider(height: 30),

            const Text("Victim/User Coordinates",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
            const SizedBox(height: 8),

            TextField(
              controller: _userLatController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter Latitude",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _userLngController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Enter Longitude",
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: 12),
            ElevatedButton.icon(
              onPressed: () {
                double? lat = double.tryParse(_userLatController.text);
                double? lng = double.tryParse(_userLngController.text);
                if (lat != null && lng != null) {
                  _openMap(lat, lng);
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Enter valid coordinates')),
                  );
                }
              },
              icon: const Icon(Icons.location_on),
              label: const Text("View User Location"),
            ),

            const SizedBox(height: 30),
            const Text(
              "Your data is encrypted and safe!",
              style: TextStyle(fontStyle: FontStyle.italic),
            )
          ],
        ),
      ),
    );
  }
}

