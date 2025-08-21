import 'package:flutter/material.dart';
import 'package:flutter_application_1/controllers/student_controller.dart';
import 'package:flutter_application_1/view/screens/main_screen.dart';
import 'package:provider/provider.dart';
void main(){
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => StudentController()),
      ],
      child: const MyApp(),
    ),);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter App',
      home:MainScreen(),
    );
  }
}

