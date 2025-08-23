import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/app_colors.dart';
import 'package:flutter_application_1/models/notes_model.dart';
import 'package:flutter_application_1/views/screens/details_note.dart';

class ListWidget extends StatefulWidget {
  final Note note;
  const ListWidget({super.key, required this.note});

  @override
  State<ListWidget> createState() => _ListWidgetState();
}

class _ListWidgetState extends State<ListWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => DetailsNoteScreen(note: widget.note),
          ),
        );
      },
      child: Card(
        elevation: 5,
        margin: const EdgeInsets.all(10),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        color: AppColors.cardBackground,
        child: ListTile(
          title: Text(
            widget.note.title,
            style: TextStyle(
              color: AppColors.text,
              fontWeight: FontWeight.bold,
              fontSize: 20,
            ),
          ),
          leading:Image.asset("assets/images/Task.png"),
          trailing: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Day: ${widget.note.day}',
                style: TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
              Text(
                'Hour: ${widget.note.hour}',
                style: TextStyle(
                  color: AppColors.text,
                  fontWeight: FontWeight.bold,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
