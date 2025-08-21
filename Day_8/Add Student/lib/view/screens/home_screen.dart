import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/student_controller.dart';
import 'package:flutter_application_1/view/widgets/main_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  Widget build(BuildContext context) {
    final students = Provider.of<StudentController>(context).students;
    return students.isNotEmpty
        ?  ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index) {
              final student = students[index];
              return Card(
                margin: const EdgeInsets.only(top: 14, left: 10, right: 10),
                elevation: 5,
                color: Colors.blue[100],
                child: MainWidget(student: student),
              );
            },
          )
        : Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Lottie.asset(
                  'assets/lottie/NoData.json',
                  width: 300,
                  height: 300,
                ),
                const SizedBox(height: 15),
                Text("No students found",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          );
  }
}