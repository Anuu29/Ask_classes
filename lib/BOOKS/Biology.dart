import 'package:flutter/material.dart';

class BiologyDetailPage extends StatefulWidget {
  final String subjectName;

  BiologyDetailPage({required this.subjectName});

  @override
  _MathsDetailPageState createState() => _MathsDetailPageState();
}

class _MathsDetailPageState extends State<BiologyDetailPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.subjectName,
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.orange,
        elevation: 4,
      ),
      body: Column(
        children: [
          Container(
            color: Colors.orange.shade100,
            child: TabBar(
              controller: _tabController,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.orange,
              indicator: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(30),
              ),
              tabs: [
                Tab(text: "Overview"),
                Tab(text: "Contents"),
                Tab(text: "Live Classes"),
                Tab(text: "Announcements"),
              ],
            ),
          ),
          Expanded(
            child: TabBarView(
              controller: _tabController,
              children: [
                _buildOverview(),
                _buildContents(),
                _buildLiveClasses(),
                _buildAnnouncements(),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildOverview() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Overview",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          Text(
            "This is an introductory course in ${widget.subjectName}. Here you will learn the basics and advanced concepts to help you excel in the subject.",
            style: TextStyle(fontSize: 16, color: Colors.grey[700]),
          ),
        ],
      ),
    );
  }

  Widget _buildContents() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(20),
      child: ListView(
        children: [
          _buildContentItem("Chapter 1: Introduction"),
          _buildContentItem("Chapter 2: Basic Concepts"),
          _buildContentItem("Chapter 3: Advanced Theories"),
          _buildContentItem("Chapter 4: Practical Applications"),
        ],
      ),
    );
  }

  Widget _buildContentItem(String title) {
    return ListTile(
      leading: Icon(Icons.book, color: Colors.orange),
      title: Text(
        title,
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildLiveClasses() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Live Classes",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.video_call, color: Colors.green),
            title: Text("Live Class: Topic 1"),
            subtitle: Text("Scheduled: Monday, 10 AM"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
          ListTile(
            leading: Icon(Icons.video_call, color: Colors.green),
            title: Text("Live Class: Topic 2"),
            subtitle: Text("Scheduled: Wednesday, 2 PM"),
            trailing: Icon(Icons.arrow_forward_ios, size: 16),
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncements() {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Announcements",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(height: 10),
          ListTile(
            leading: Icon(Icons.announcement, color: Colors.blue),
            title: Text("Assignment 1 due next week"),
          ),
          ListTile(
            leading: Icon(Icons.announcement, color: Colors.blue),
            title: Text("Midterm exams scheduled for next month"),
          ),
        ],
      ),
    );
  }
}
