import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/app_colors.dart';
import 'package:flutter_application_1/models/notes_model.dart';
import 'package:flutter_application_1/views/screens/details_note.dart';

class GridWidget extends StatefulWidget {
  final Note note;
  const GridWidget({super.key, required this.note});

  @override
  State<GridWidget> createState() => _GridWidgetState();
}

class _GridWidgetState extends State<GridWidget> {
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 60,
              width: 60,
              padding: const EdgeInsets.all(8.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                border: Border.all(color: Colors.black, width: 3),  
              ),
              child: Text(
                '${widget.note.id}',
                style: TextStyle(fontSize: 12, color: AppColors.text),
              ),
            ),
            Text(
              widget.note.title,
              style: const TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.bold,
                fontSize: 20,
              ),
            ),
            Text(
              widget.note.description,
              style: const TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              'Day: ${widget.note.day}, Hour: ${widget.note.hour}',
              style: const TextStyle(
                color: AppColors.text,
                fontWeight: FontWeight.bold,
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
