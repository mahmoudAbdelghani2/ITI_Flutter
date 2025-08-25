import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/notes_controllers.dart';
import 'package:flutter_application_1/views/screens/home_screen.dart';
import 'package:provider/provider.dart';

void main()  {
  runApp(
    ChangeNotifierProvider(
      create: (context) => NotesController(),
      child: const MyApp(),
    ),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter',
      home: HomeScreen(),
    );
  }
}