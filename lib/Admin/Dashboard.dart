import 'package:flutter/material.dart';

class TeacherDashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "ASK Classes",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: false,
        actions: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                "MS",
                style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              ),
              Text(
                "Mr. Smith",
                style: TextStyle(color: Colors.black, fontSize: 12),
              ),
            ],
          ),
          IconButton(
            icon: Icon(Icons.logout, color: Colors.black),
            onPressed: () {
              // Handle logout
            },
          ),
        ],
      ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          double cardWidth = constraints.maxWidth > 600
              ? constraints.maxWidth / 2 - 24
              : constraints.maxWidth - 32;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Wrap(
                spacing: 16,
                runSpacing: 16,
                children: _dashboardItems.map((item) {
                  return _buildDashboardCard(
                    icon: item['icon'] as IconData,
                    title: item['title'] as String,
                    subtitle: item['subtitle'] as String,
                    buttonText: item['buttonText'] as String,
                    color: item['color'] as Color,
                    width: cardWidth,
                    onTap: () {
                      // Handle specific card actions
                    },
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildDashboardCard({
    required IconData icon,
    required String title,
    required String subtitle,
    required String buttonText,
    required Color color,
    required double width,
    required VoidCallback onTap,
  }) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black12,
            blurRadius: 8,
            spreadRadius: 2,
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 30,
              backgroundColor: color.withOpacity(0.2),
              child: Icon(icon, size: 32, color: color),
            ),
            SizedBox(height: 16),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18, fontWeight: FontWeight.bold, color: Colors.black),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8),
            Text(
              subtitle,
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: onTap,
              style: ElevatedButton.styleFrom(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
                backgroundColor: Colors.grey[200],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
              child: Text(
                buttonText,
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

final _dashboardItems = [
  {
    "icon": Icons.add_circle_outline,
    "title": "Add Assignment",
    "subtitle": "Create and assign new work to your classes",
    "buttonText": "Create Assignment",
    "color": Colors.purple,
  },
  {
    "icon": Icons.schedule,
    "title": "Schedule Class",
    "subtitle": "Plan and organize your upcoming classes",
    "buttonText": "Schedule New Class",
    "color": Colors.blue,
  },
  {
    "icon": Icons.check_circle_outline,
    "title": "Mark Attendance",
    "subtitle": "Record student attendance for your classes",
    "buttonText": "Take Attendance",
    "color": Colors.green,
  },
  {
    "icon": Icons.analytics_outlined,
    "title": "View Reports",
    "subtitle": "Access and analyze class performance data",
    "buttonText": "Open Reports",
    "color": Colors.orange,
  },
];

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: TeacherDashboard(),
  ));
}
