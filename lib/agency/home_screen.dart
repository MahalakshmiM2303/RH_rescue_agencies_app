import 'package:flutter/material.dart';
import 'dashboard_screen.dart';
import 'request_management_screen.dart';
import 'prep_broadcast_screen.dart';
import 'location_tracker_screen.dart';

class AgencyHomeScreen extends StatelessWidget {
  const AgencyHomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      body: Column(
        children: [
          // Header Section
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 40, horizontal: 20),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [Color(0xFFFFCDD2), Color(0xFFE57373)], // Light pink-red
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
            ),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Rescue Hub - Agency Panel',
                  style: TextStyle(
                    color: Color.fromARGB(255, 33, 30, 30),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Manage rescue operations and requests here.',
                  style: TextStyle(
                    color: Color.fromARGB(179, 36, 34, 34),
                    fontSize: 16,
                  ),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // Button Grid Section
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: GridView.count(
                crossAxisCount: 2,
                crossAxisSpacing: 16,
                mainAxisSpacing: 16,
                children: [
                  _buildButton(context, "Dashboard", Icons.dashboard, const DashboardScreen()),
                  _buildButton(context, "Requests", Icons.assignment, const RequestManagementScreen()),
                  _buildButton(context, "Broadcast", Icons.campaign, const PrepBroadcastScreen()),
                  _buildButton(context, "Track Location", Icons.location_on, const LocationTrackerScreen()),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildButton(BuildContext context, String title, IconData icon, Widget targetScreen) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black87,
        padding: const EdgeInsets.all(16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        elevation: 5,
      ),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (_) => targetScreen),
        );
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 36, color: const Color.fromARGB(255, 220, 66, 66)),
          const SizedBox(height: 10),
          Text(title, textAlign: TextAlign.center, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }
}
