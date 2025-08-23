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
  String _currentView = "List View";
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
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.notes),
                    const SizedBox(width: 6),
                    DropdownButton<String>(
                      value: _currentView,
                      underline: const SizedBox(),
                      icon: const Icon(
                        Icons.arrow_drop_down,
                        color: Colors.white,
                      ),
                      dropdownColor: Colors.white,
                      style: const TextStyle(color: AppColors.textLight),
                      items: const [
                        DropdownMenuItem(
                          value: "Grid View",
                          child: Text(
                            "Grid View",
                            style: TextStyle(color: AppColors.textLight),
                          ),
                        ),
                        DropdownMenuItem(
                          value: "List View",
                          child: Text(
                            "List View",
                            style: TextStyle(color: AppColors.textLight),
                          ),
                        ),
                      ],
                      onChanged: (value) {
                        if (value != null) {
                          setState(() {
                            _currentView = value;
                          });
                        }
                      },
                    ),
                  ],
                ),
              ),
              Tab(
                child: Row(
                  children: [
                    Icon(Icons.add),
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
            Center(child: NotesScreen(_currentView)),
            Center(child: AddNotesScreen()),
          ],
        ),
      ),
    );
  }
}
