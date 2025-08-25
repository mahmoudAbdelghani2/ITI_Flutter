import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/notes_controllers.dart';
import 'package:flutter_application_1/helper/app_colors.dart';
import 'package:flutter_application_1/models/notes_model.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:lottie/lottie.dart';

class AddNotesScreen extends StatefulWidget {
  const AddNotesScreen({super.key});

  @override
  State<AddNotesScreen> createState() => _AddNotesScreenState();
}

class _AddNotesScreenState extends State<AddNotesScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _descriptionController = TextEditingController();
  final TextEditingController _dayController = TextEditingController();
  final TextEditingController _hourController = TextEditingController();

  Future<DateTime?> _pickDay(BuildContext context) async {
    DateTime? pickedTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
      helpText: "Choose a day",
      cancelText: "Cancel",
      confirmText: "Confirm",
    );

    return pickedTime;
  }

  Future<TimeOfDay?> _pickHour(BuildContext context) async {
    TimeOfDay? pickedHour = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      helpText: "Choose an hour",
      cancelText: "Cancel",
      confirmText: "Confirm",
    );

    return pickedHour;
  }

  Future<void> _saveNote() async {
    if (_formKey.currentState!.validate()) {
      final String title = _titleController.text;
      final String description = _descriptionController.text;
      final String hourTime = _hourController.text;
      final String day = _dayController.text;

      final newNote = Note(
        title: title,
        description: description,
        day: day,
        hour: hourTime,
      );

      await Provider.of<NotesController>(
        context,
        listen: false,
      ).addNote(newNote);

      _titleController.clear();
      _descriptionController.clear();
      _dayController.clear();
      _hourController.clear();
      
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Note added successfully!',
            style: TextStyle(color: AppColors.text),
          ),
          backgroundColor: Colors.green,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
          child: Column(
            children: [
              SizedBox(
                height: 200,
                width: 200,
                child: Lottie.asset('assets/lottie/PaperNotes.json'),
              ),
              TextFormField(
                controller: _titleController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.title),
                  labelText: 'Title',
                  labelStyle: TextStyle(color: AppColors.textFieldText),
                  fillColor: AppColors.textFieldBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 3) {
                    return 'Please enter a valid title';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _descriptionController,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.description),
                  labelText: 'Description',
                  labelStyle: TextStyle(color: AppColors.textFieldText),
                  fillColor: AppColors.textFieldBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || value.length < 5) {
                    return 'Please enter a valid description';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _dayController,
                readOnly: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.calendar_today),
                  labelText: 'Day',
                  labelStyle: TextStyle(color: AppColors.textFieldText),
                  fillColor: AppColors.textFieldBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid day';
                  }
                  return null;
                },
                onTap: () async {
                  final pickedDate = await _pickDay(context);
                  if (pickedDate != null) {
                    _dayController.text = DateFormat(
                      'yyyy-MM-dd',
                    ).format(pickedDate);
                  }
                },
              ),
              const SizedBox(height: 10),
              TextFormField(
                controller: _hourController,
                readOnly: true,
                decoration: InputDecoration(
                  prefixIcon: Icon(Icons.access_time),
                  labelText: 'Hour',
                  labelStyle: TextStyle(color: AppColors.textFieldText),
                  fillColor: AppColors.textFieldBackground,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a valid hour';
                  }
                  return null;
                },
                onTap: () async {
                  final pickedTime = await _pickHour(context);
                  if (pickedTime != null) {
                    final now = DateTime.now();
                    final dt = DateTime(
                      now.year,
                      now.month,
                      now.day,
                      pickedTime.hour,
                      pickedTime.minute,
                    );
                    _hourController.text = DateFormat('HH:mm').format(dt);
                  }
                },
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.saveButtonColor,
                    padding: const EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () => _saveNote(),
                  child: Text(
                    'Save Note',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: AppColors.text),
                  ),
                ),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
