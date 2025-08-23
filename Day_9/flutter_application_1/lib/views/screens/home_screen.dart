import 'package:flutter/material.dart';
import 'package:flutter_application_1/helper/app_colors.dart';
import 'package:flutter_application_1/views/screens/add_notes_screen.dart';
import 'package:flutter_application_1/views/screens/notes_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late final TabController _tabBarController;

  @override
  void initState() {
    super.initState();
    _tabBarController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text('Notes App'),
          centerTitle: true,
          backgroundColor: AppColors.appBar,
          bottom: TabBar(
            controller: _tabBarController,
            tabs: [
              Tab(
                child: Row(
                  children: [
                    Icon(Icons.notes_outlined, color: AppColors.textLight),
                    SizedBox(width: 8),
                    Text(
                      'All Notes',
                      style: TextStyle(color: AppColors.textLight),
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Icon(Icons.add, color: AppColors.textLight),
                    SizedBox(width: 8),
                    Text(
                      'Add Note',
                      style: TextStyle(color: AppColors.textLight),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          controller: _tabBarController,
          children: [
            Center(child: NotesScreen()),
            Center(child: AddNotesScreen()),
          ],
        ),
      ),
    );
  }
}
