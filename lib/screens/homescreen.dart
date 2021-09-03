import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/new_task_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Tasks'),
      ),
      body: Center(
        child: Text('No tasks'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          Navigator.of(context).pushNamed(NewTaskScreen.routeName);
        },
      ),
    );
  }
}
