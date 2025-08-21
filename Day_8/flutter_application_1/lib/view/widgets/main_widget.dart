// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/student_controller.dart';
import 'package:flutter_application_1/model/student.dart';
import 'package:flutter_application_1/view/screens/details_screen.dart';
import 'package:provider/provider.dart';

class MainWidget extends StatelessWidget {
  final Student student;
  const MainWidget({super.key, required this.student});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsScreen(student: student),
          ),
        );
      },
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: Colors.blue,
          radius: 30,
          child: student.gender == "Male"
              ?  Image.asset("assets/images/Male.png")
              :  Image.asset("assets/images/Female.png"),
        ),
        title: Text(
          student.name,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
        ),
        subtitle: Text(
          student.email,
          style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        trailing: IconButton(
          icon: const Icon(Icons.delete),
          onPressed: () async {
            final confirm = await showDialog<bool>(
              context: context,
              builder: (context) => AlertDialog(
                title: const Text("Confirm Delete"),
                content: Text(
                  "Are you sure you want to delete ${student.name}?",
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(false),
                    child: const Text("Cancel"),
                  ),
                  ElevatedButton(
                    onPressed: () => Navigator.of(context).pop(true),
                    child: const Text("Delete"),
                  ),
                ],
              ),
            );
            if (confirm == true) {
              Provider.of<StudentController>(
                context,
                listen: false,
              ).removeStudent(student);

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text("${student.name} deleted")),
              );
            }
          },
        ),
      ),
    );
  }
}
