import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/student.dart';

class DetailsScreen extends StatefulWidget {
  final Student student;
  const DetailsScreen({super.key, required this.student});

  @override
  State<DetailsScreen> createState() => _DetailsWidgetState();
}

class _DetailsWidgetState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.blue[300],
      elevation: 5,
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text("Name :${widget.student.name}"),
            SizedBox(height: 10),
            Text("Email :${widget.student.email}"),
            SizedBox(height: 10),
            Text("Gender :${widget.student.gender}"),
            SizedBox(height: 10),
            Text("Active :${widget.student.active}"),
            SizedBox(height: 10),
            Text("Notifications :${widget.student.notifications}"),
            SizedBox(height: 10),
            Text("Date Of Bairth :${widget.student.dob}"),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
