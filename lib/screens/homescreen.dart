import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/screens/new_task_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> list = [];
  List<Todo> tList = [];

  void editTodo(Todo item) async {
    MaterialPageRoute editItemView =
        MaterialPageRoute(builder: (context) => NewTaskScreen(item));

    dynamic result = await Navigator.of(context).push(editItemView);
    item.title = result.toString();
    setState(() {});
  }

  void deleteTodo(Todo item) {
    tList.remove(item);
  }

  void changeDoneness(Todo item) {
    setState(() {
      item.isCompleted = !item.isCompleted;
    });
  }

  Widget dismissibleItem(Todo item, int index) {
    return Dismissible(
        background: Container(
            color: Colors.red,
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.delete)),
        key: Key('1'),
        child: ListTile(
          onLongPress: () => editTodo(item),
          onTap: () => changeDoneness(item),
          title: Text(item.title.toString()),
          trailing: Icon(item.isCompleted
              ? Icons.check_box
              : Icons.check_box_outline_blank),
        ));
  }

  Widget buildMyList() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: tList.length,
      itemBuilder: (BuildContext context, int index) =>
          dismissibleItem(tList[index], index),
    );
  }

  Widget buildView() {
    return Column(children: [buildMyList()]);
  }

  void addingATask() async {
    dynamic result =
        await Navigator.of(context).pushNamed(NewTaskScreen.routeName);

    tList.add(Todo(title: result, isCompleted: false));
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Tasks'),
      ),
      body: buildView(),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: addingATask,
      ),
    );
  }
}
