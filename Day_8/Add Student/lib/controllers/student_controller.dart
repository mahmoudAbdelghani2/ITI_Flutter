import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/student.dart';

class StudentController extends ChangeNotifier {
  final List<Student> _students = [];

  List<Student> get students => _students;

  void addStudent(Student student) {
    _students.add(student);
    notifyListeners();
  }

  void removeStudent(Student student) {
    _students.remove(student);
    notifyListeners();
  }
  
}