import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/notes_controllers.dart';
import 'package:flutter_application_1/helper/app_colors.dart';
import 'package:flutter_application_1/models/notes_model.dart';
import 'package:flutter_application_1/views/screens/home_screen.dart';
import 'package:provider/provider.dart';

class DetailsNoteScreen extends StatefulWidget {
  final Note note;
  const DetailsNoteScreen({super.key, required this.note});

  @override
  State<DetailsNoteScreen> createState() => _DetailsNoteState();
}

class _DetailsNoteState extends State<DetailsNoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackground,
      appBar: AppBar(
        title: Text(
          'Note Details',
          style: TextStyle(
            color: AppColors.text,
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        centerTitle: true,
        backgroundColor: AppColors.appBar,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              const SizedBox(height: 20),
              CircleAvatar(
                radius: 100,
                backgroundImage: AssetImage('assets/images/noteDetails.png'),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                color: AppColors.cardBackground,
                child: ListTile(
                  title: Text(
                    widget.note.title,
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/images/noteTitle.png'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                color: AppColors.cardBackground,
                child: ListTile(
                  title: Text(
                    'Description: ${widget.note.description}',
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/images/noteDesc.png'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Card(
                elevation: 5,
                color: AppColors.cardBackground,
                child: ListTile(
                  title: Text(
                    'Day: ${widget.note.day}',
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(
                    'Hour: ${widget.note.hour}',
                    style: TextStyle(
                      color: AppColors.text,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  leading: CircleAvatar(
                    radius: 15,
                    backgroundImage: AssetImage('assets/images/noteTime.jpg'),
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Edit Note'),
                          content: Text('Cannot edit note now.'),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                          ],
                        );
                      },
                    );
                    
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.editButton,
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    'Edit Note',
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.9,
                child: ElevatedButton(
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Delete Note'),
                          content: Text(
                            'Are you sure you want to delete this note?',
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text('Cancel'),
                            ),
                            TextButton(
                              onPressed: () {
                                Provider.of<NotesController>(
                                  context,
                                  listen: false,
                                ).removeNote(widget.note.id!);
                                Navigator.of(
                                  context,
                                ).push(MaterialPageRoute(builder: (context) {
                                  return HomeScreen();
                                }));
                              },
                              child: Text('Delete'),
                            ),
                          ],
                        );
                      },
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.deleteButton,
                    padding: EdgeInsets.symmetric(vertical: 12),
                  ),
                  child: Text(
                    'Delete Note',
                    style: TextStyle(
                      color: AppColors.text,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
