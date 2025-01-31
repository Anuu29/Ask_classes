import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final Map<String, dynamic> studentProfile = {
    "name": "Alex Johnson",
    "rollNo": "2024-CS-101",
    "department": "Computer Science",
    "totalFees": 10000,
    "paidFees": 7500,
    "attendance": 85,
    "courses": ["Data Structures", "Operating Systems", "Database Management", "AI & ML"],
  };

  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Profile"),
          bottom: TabBar(
            tabs: [
              Tab(icon: Icon(Icons.info), text: "Overview"),
              Tab(icon: Icon(Icons.access_time), text: "Attendance"),
              Tab(icon: Icon(Icons.attach_money), text: "Fees"),
              Tab(icon: Icon(Icons.book), text: "Courses"),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _buildOverviewTab(),
            _buildAttendanceTab(),
            _buildFeesTab(),
            _buildCoursesTab(),
          ],
        ),
      ),
    );
  }

  Widget _buildOverviewTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            studentProfile["name"],
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 8),
          Text("Roll No: ${studentProfile["rollNo"]}"),
          Text("Department: ${studentProfile["department"]}"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _editProfile();
            },
            child: Text("Edit Profile"),
          ),
        ],
      ),
    );
  }

  Widget _buildAttendanceTab() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          Text("Attendance", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          LinearProgressIndicator(
            value: studentProfile["attendance"] / 100,
            backgroundColor: Colors.grey[300],
            valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          ),
          SizedBox(height: 8),
          Text("${studentProfile["attendance"]}% Attendance"),
          SizedBox(height: 20),
          TableCalendar(
            focusedDay: _focusedDay,
            firstDay: DateTime(_focusedDay.year, _focusedDay.month - 3),
            lastDay: DateTime(_focusedDay.year, _focusedDay.month + 3),
            calendarFormat: CalendarFormat.month,
            selectedDayPredicate: (day) {
              return isSameDay(_selectedDay, day);
            },
            onDaySelected: (selectedDay, focusedDay) {
              setState(() {
                _selectedDay = selectedDay;
                _focusedDay = focusedDay;
              });
            },
            calendarStyle: CalendarStyle(
              todayDecoration: BoxDecoration(
                color: Colors.blueAccent,
                shape: BoxShape.circle,
              ),
              selectedDecoration: BoxDecoration(
                color: Colors.green,
                shape: BoxShape.circle,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFeesTab() {
    final balance = studentProfile["totalFees"] - studentProfile["paidFees"];
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Fees", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          Text("Total Fees: \$${studentProfile["totalFees"]}"),
          Text("Paid: \$${studentProfile["paidFees"]}"),
          Text("Balance: \$${balance}"),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              _payFees();
            },
            child: Text("Pay Now"),
          ),
        ],
      ),
    );
  }

  Widget _buildCoursesTab() {
    return ListView.builder(
      padding: EdgeInsets.all(16),
      itemCount: studentProfile["courses"].length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Icon(Icons.book),
          title: Text(studentProfile["courses"][index]),
          trailing: Icon(Icons.arrow_forward),
          onTap: () {
            _viewCourseDetails(studentProfile["courses"][index]);
          },
        );
      },
    );
  }

  void _editProfile() {
    // Navigate to edit profile page or show a dialog
    print("Edit Profile Button Clicked");
  }

  void _payFees() {
    // Handle payment process
    print("Pay Now Button Clicked");
  }

  void _viewCourseDetails(String courseName) {
    // Navigate to course details page
    print("Viewing details for $courseName");
  }
}
