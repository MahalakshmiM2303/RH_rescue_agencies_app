import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Agency Dashboard'),
        backgroundColor: Colors.redAccent,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [
              // Top space added before Stats
              const SizedBox(height: 20),

              // Key Stats Overview with better colors
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildStatsCard("Total Active Requests", "10", Colors.blueAccent),
                  _buildStatsCard("Total Resolved", "5", Colors.green),
                  _buildStatsCard("Field Teams Available", "3", Colors.orange),
                ],
              ),
              const SizedBox(height: 30),

              // Ongoing Operations
              const Text(
                "Ongoing Operations",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              _buildOngoingOperationCard(
                "Team Alpha",
                "Sector 9, Riverdale",
                "On Route",
                Icons.location_on,
              ),
              const SizedBox(height: 20),

              // Highlighted Urgent Requests with distinct colors
              const Text(
                "Urgent Requests",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.red),
              ),
              const SizedBox(height: 10),
              _buildUrgentRequestCard(
                "Flood Rescue - Sector 9",
                "Family stranded on rooftop",
                Colors.redAccent,
              ),
              const SizedBox(height: 20),

              // Recent Activity Table-like structure
              const Text(
                "Recent Activity",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black87),
              ),
              const SizedBox(height: 10),
              _buildRecentActivityFeed(),
            ],
          ),
        ),
      ),
    );
  }

  // Function to create Stats Card with improved colors
  Widget _buildStatsCard(String title, String value, Color color) {
    return Card(
      elevation: 8,
      color: color.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Text(title, style: const TextStyle(fontSize: 14, color: Colors.black)),
            const SizedBox(height: 8),
            Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
          ],
        ),
      ),
    );
  }

  // Function to create Ongoing Operation Card
  Widget _buildOngoingOperationCard(String team, String location, String status, IconData icon) {
    return Card(
      elevation: 8,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(team, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                const SizedBox(height: 6),
                Text("Location: $location", style: const TextStyle(fontSize: 14)),
                const SizedBox(height: 6),
                Text("Status: $status", style: const TextStyle(fontSize: 14)),
              ],
            ),
            Icon(icon, color: Colors.blue, size: 40),
          ],
        ),
      ),
    );
  }

  // Function to create Urgent Request Card with highlighted color
  Widget _buildUrgentRequestCard(String title, String description, Color color) {
    return Card(
      elevation: 8,
      color: color.withOpacity(0.1),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.red)),
            const SizedBox(height: 8),
            Text(description, style: const TextStyle(fontSize: 14, color: Colors.black87)),
          ],
        ),
      ),
    );
  }

  // Function to create Recent Activity Feed (with table-like structure)
  Widget _buildRecentActivityFeed() {
    final List<Map<String, String>> recentRequests = [
      {"type": "Flood Rescue", "location": "Sector 9", "status": "Pending"},
      {"type": "Fire Rescue", "location": "Sector 5", "status": "In Progress"},
      {"type": "Medical Aid", "location": "Sector 3", "status": "Resolved"},
    ];

    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black38),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text("Type", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Location", style: TextStyle(fontWeight: FontWeight.bold)),
              Text("Status", style: TextStyle(fontWeight: FontWeight.bold)),
            ],
          ),
          const Divider(),
          ...recentRequests.map((request) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(request['type']!),
                Text(request['location']!),
                Text(request['status']!),
              ],
            );
          }).toList(),
        ],
      ),
    );
  }
}


























// import 'package:flutter/material.dart';

// class DashboardScreen extends StatelessWidget {
//   const DashboardScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Agency Dashboard'),
//         backgroundColor: Colors.redAccent,
//       ),
//       body: SingleChildScrollView(  // Added ScrollView
//         child: Padding(
//           padding: const EdgeInsets.all(12.0),
//           child: Column(
//             children: [
//               // Key Stats Overview
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                 children: [
//                   _buildStatsCard("Total Active Requests", "10", Colors.blue),
//                   _buildStatsCard("Total Resolved", "5", Colors.green),
//                   _buildStatsCard("Field Teams Available", "3", const Color.fromARGB(255, 247, 148, 0)),
//                 ],
//               ),
//               const SizedBox(height: 20),

//               // Ongoing Operations
//               const Text(
//                 "Ongoing Operations",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               _buildOngoingOperationCard(
//                 "Team Alpha",
//                 "Sector 9, Riverdale",
//                 "On Route",
//                 Icons.location_on,
//               ),
//               const SizedBox(height: 20),

//               // Urgent Requests/Alerts
//               const Text(
//                 "Urgent Requests",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               _buildUrgentRequestCard(
//                 "Flood Rescue - Sector 9",
//                 "Family stranded on rooftop",
//                 Colors.redAccent,
//               ),
//               const SizedBox(height: 20),

//               // Recent Activity Feed
//               const Text(
//                 "Recent Activity",
//                 style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//               ),
//               const SizedBox(height: 10),
//               _buildRecentActivityFeed(),
//             ],
//           ),
//         ),
//       ),
//     );
//   }

//   // Function to create Stats Card
//   Widget _buildStatsCard(String title, String value, Color color) {
//     return Card(
//       elevation: 5,
//       color: color.withOpacity(0.1),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Text(title, style: const TextStyle(fontSize: 14, color: Colors.black)),
//             const SizedBox(height: 8),
//             Text(value, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: color)),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to create Ongoing Operation Card
//   Widget _buildOngoingOperationCard(String team, String location, String status, IconData icon) {
//     return Card(
//       elevation: 5,
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text(team, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//                 const SizedBox(height: 6),
//                 Text("Location: $location", style: const TextStyle(fontSize: 14)),
//                 const SizedBox(height: 6),
//                 Text("Status: $status", style: const TextStyle(fontSize: 14)),
//               ],
//             ),
//             Icon(icon, color: Colors.blue, size: 40),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to create Urgent Request Card
//   Widget _buildUrgentRequestCard(String title, String description, Color color) {
//     return Card(
//       elevation: 5,
//       color: color.withOpacity(0.1),
//       shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
//       child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 8),
//             Text(description, style: const TextStyle(fontSize: 14)),
//           ],
//         ),
//       ),
//     );
//   }

//   // Function to create Recent Activity Feed (with static data)
//   Widget _buildRecentActivityFeed() {
//     final List<Map<String, String>> recentRequests = [
//       {"type": "Flood Rescue", "location": "Sector 9", "status": "Pending"},
//       {"type": "Fire Rescue", "location": "Sector 5", "status": "In Progress"},
//       {"type": "Medical Aid", "location": "Sector 3", "status": "Resolved"},
//     ];

//     return ListView.builder(
//       shrinkWrap: true,
//       physics: const NeverScrollableScrollPhysics(),
//       itemCount: recentRequests.length,
//       itemBuilder: (context, index) {
//         final request = recentRequests[index];
//         return ListTile(
//           title: Text(request['type']!),
//           subtitle: Text("Location: ${request['location']}"),
//           trailing: Text("Status: ${request['status']}"),
//         );
//       },
//     );
//   }
// }
