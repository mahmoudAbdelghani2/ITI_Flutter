import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/notes_controllers.dart';
import 'package:flutter_application_1/views/widgets/grid_notes_widget.dart';
import 'package:flutter_application_1/views/widgets/list_notes_widget.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatefulWidget {
  final String currentView;
  const NotesScreen(this.currentView, {super.key});

  @override
  State<NotesScreen> createState() => _NotesScreenState();
}

class _NotesScreenState extends State<NotesScreen> {
  @override
  Widget build(BuildContext context) {
    final notesController = Provider.of<NotesController>(context);
    return ListView.builder(
      itemCount: notesController.notes.length,
      itemBuilder: (context, index) {
        final note = notesController.notes[index];
        return widget.currentView == "List View"
            ? ListWidget(note: note)
            : GridWidget(note: note);
      },
    );
  }
}
