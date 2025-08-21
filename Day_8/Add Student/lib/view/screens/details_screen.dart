import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/student.dart';

class DetailsScreen extends StatelessWidget {
  final Student student;
  const DetailsScreen({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text("Details for ${student.name}"),
        centerTitle: true,
        backgroundColor: Colors.blue,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                CircleAvatar(
                  backgroundColor: Colors.grey[200],
                  radius: 80,
                  backgroundImage: AssetImage(
                    student.gender.toLowerCase() == "male"
                        ? "assets/images/Male2.png"
                        : "assets/images/Female2.jpg",
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  student.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black87,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 20),

                Card(
                  child: ListTile(
                    leading: const Icon(Icons.email, color: Colors.blue),
                    title: const Text("Email"),
                    subtitle: Text(
                      student.email,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: const Icon(Icons.person, color: Colors.purple),
                    title: const Text("Gender"),
                    subtitle: Text(
                      student.gender,
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: Icon(
                      student.active ? Icons.check_circle : Icons.cancel,
                      color: student.active ? Colors.green : Colors.red,
                    ),
                    title: const Text("Active"),
                    subtitle: Text(
                      student.active ? "Yes" : "No",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: Icon(
                      student.notifications
                          ? Icons.notifications
                          : Icons.notifications_off,
                      color: student.notifications
                          ? Colors.orange
                          : Colors.grey,
                    ),
                    title: Text("Notifications"),
                    subtitle: Text(
                      student.notifications ? "Enabled" : "Disabled",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),

                Card(
                  child: ListTile(
                    leading: const Icon(Icons.cake, color: Colors.red),
                    title: const Text("Date of Birth"),
                    subtitle: Text(
                      "${student.dob.year}-${student.dob.month}-${student.dob.day}",
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
