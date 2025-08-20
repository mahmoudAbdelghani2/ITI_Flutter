import 'package:flutter/material.dart';
import 'package:flutter_application_1/model/student.dart';

class MainWidget extends StatefulWidget {
  final Student student;
  const MainWidget({super.key, required this.student});

  @override
  State<MainWidget> createState() => _MainWidgetState();
}

class _MainWidgetState extends State<MainWidget> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        widget.student.name,
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 23),
      ),
      subtitle: Text(
        'Age: ${widget.student.age}',
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
      ),
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: () {
          // Handle delete action
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${widget.student.name} deleted')),
          );
        },
      ),
    );
  }
}
