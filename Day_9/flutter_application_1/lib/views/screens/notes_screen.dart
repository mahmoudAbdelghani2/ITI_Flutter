import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/notes_controllers.dart';
import 'package:flutter_application_1/views/widgets/list_notes_widget.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget {
  const NotesScreen({super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    final notesController = Provider.of<NotesController>(context);
    if (notesController.notes.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Lottie.asset('assets/lottie/NoData.json', width: 200),
            SizedBox(height: 20),
            Text(
              'No Data Found',
              style: TextStyle(fontSize: 20, color: Colors.grey),
            ),
          ],
        ),
      );
    }
    return ListView.builder(
      itemCount: notesController.notes.length,
      itemBuilder: (context, index) {
        final note = notesController.notes[index];
        return ListWidget(note: note);
      },
    );
  }
}
