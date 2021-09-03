import 'package:flutter/material.dart';

class NewTaskScreen extends StatelessWidget {
  const NewTaskScreen({Key? key}) : super(key: key);
  static const routeName = '/newTask';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('New Tasks'),
      ),
      body: Center(
        child: ElevatedButton(
          child: Text('Submit'),
          onPressed: () {},
        ),
      ),
    );
  }
}
