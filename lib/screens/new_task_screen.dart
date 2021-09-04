import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';

class NewTaskScreen extends StatefulWidget {
  final Todo? item;
  const NewTaskScreen({this.item});
  static const routeName = '/newTask';

  @override
  _NewTaskScreenState createState() => _NewTaskScreenState();
}

class _NewTaskScreenState extends State<NewTaskScreen> {
  TextEditingController titleController = new TextEditingController();

  @override
  void initState() {
    // To set the incoming title of the todo task item
    if (widget.item != null)
      titleController = new TextEditingController(text: widget.item!.title);

    super.initState();
  }

  void submit() {
    Navigator.of(context).pop(titleController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Save Tasks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
                controller: titleController,
                style: TextStyle(fontSize: 20),
                decoration: InputDecoration(labelText: 'Save a task')),
            ElevatedButton(
              child: Container(
                  width: double.infinity,
                  height: 60,
                  child: Center(child: Text('Save'))),
              onPressed: () => submit(),
            )
          ],
        ),
      ),
    );
  }
}
