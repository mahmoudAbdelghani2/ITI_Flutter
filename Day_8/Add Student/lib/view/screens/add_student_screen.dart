import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/student_controller.dart';
import 'package:flutter_application_1/model/student.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class AddStudentScreen extends StatefulWidget {
  const AddStudentScreen({super.key});

  @override
  State<AddStudentScreen> createState() => _AddStudentScreenState();
}

class _AddStudentScreenState extends State<AddStudentScreen> {
  DateTime? selectedDate;

  Future<DateTime?> _pickDate() async {
    DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      initialEntryMode: DatePickerEntryMode.calendarOnly,
      helpText: "Choose a date",
      cancelText: "Cancel",
      confirmText: "Confirm",
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
    return selectedDate;
  }

  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _dobController = TextEditingController();

  String _gender = "Male";
  bool _active = false;
  bool _notifications = false;

  void _saveStudent() {
    if (_formKey.currentState!.validate()) {
      final student = Student(
        name: _nameController.text,
        email: _emailController.text,
        gender: _gender,
        active: _active,
        notifications: _notifications,
        dob: DateTime.parse(_dobController.text),
      );

      Provider.of<StudentController>(
        context,
        listen: false,
      ).addStudent(student);

      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Student saved!")));

      _nameController.clear();
      _emailController.clear();
      _dobController.clear();
      setState(() {
        _gender = "Male";
        _active = false;
        _notifications = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Form(
        key: _formKey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Lottie.asset('assets/lottie/Login.json', width: 200, height: 200),
              const SizedBox(height: 10),
              TextFormField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: "Name",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter student name";
                  }
                  if (value.length < 3) {
                    return "Name must be at least 3 characters";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Enter email";
                  }
                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                    return "Enter a valid email";
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Radio<String>(
                    value: "Male",
                    groupValue: _gender,
                    onChanged: (value) => setState(() => _gender = value!),
                  ),
                  Text("Male"),
                  const SizedBox(width: 150),
                  Radio<String>(
                    value: "Female",
                    groupValue: _gender,
                    onChanged: (value) => setState(() => _gender = value!),
                  ),
                  Text("Female"),
                ],
              ),
              const SizedBox(height: 16),

              TextFormField(
                controller: _dobController,
                decoration: InputDecoration(
                  labelText: "Date of Birth",
                  border: const OutlineInputBorder(),
                  suffixIcon: IconButton(
                    icon: const Icon(Icons.calendar_today),
                    onPressed: () async {
                      DateTime? date = await _pickDate();
                      if (date != null) {
                        _dobController.text = date.toLocal().toString().split(
                          ' ',
                        )[0];
                      }
                    },
                  ),
                ),
                readOnly: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return "Select date of birth";
                  }
                  DateTime dob = DateTime.parse(value);
                  if (dob.isAfter(DateTime.now())) {
                    return "Date of birth cannot be in the future";
                  }
                  return null;
                },
              ),
              SwitchListTile(
                title: const Text("Active"),
                activeColor: Colors.blue,
                activeTrackColor: Colors.blue[200],
                value: _active,
                onChanged: (val) => setState(() => _active = val),
              ),

              SwitchListTile(
                title: const Text("Notifications"),
                activeColor: Colors.blue,
                activeTrackColor: Colors.blue[200],
                value: _notifications,
                onChanged: (val) => setState(() => _notifications = val),
              ),

              const SizedBox(height: 20),

              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: _saveStudent,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    "Save",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
