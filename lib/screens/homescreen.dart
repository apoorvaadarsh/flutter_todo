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
  void addTodo(Todo item){
    tList.insert(0, item);
  }
  void editTodo(Todo item, String title)
  {
    item.title=title;
  }

  void deleteTodo(Todo item)
  {
    tList.remove(item);
  }
  void changeDoneness(Todo item)
  {
    if(item.isCompleted==true)
      item.isCompleted=false;
    if(item.isCompleted==false)
      item.isCompleted=true;
  }

  Todo task1 = new Todo(title: "This is task 1");
  Todo task2 = new Todo(title: "This is task 2", isCompleted: false);
  Todo task3 = new Todo(title: "This is task 3", isCompleted: true);

  Widget DismissibleItem(Todo item, int index){
    return Dismissible(
        background: Container(
            color: Colors.red,
            padding: EdgeInsets.all(10.0),
            child: Icon(Icons.delete)
        ),
        key: Key('1'),
        child: ListTile(
          title: Text(item.title.toString()),
          trailing: Icon(item.isCompleted ? Icons.check_box : Icons.check_box_outline_blank),
        ));
  }
  Widget buildMyList(){
    return ListView.builder(shrinkWrap: true, itemCount: tList.length, itemBuilder: (BuildContext context, int index) => DismissibleItem(tList[index], index),);
  }

  Widget buildView(){
    addTodo(task1);
    addTodo(task2);
    addTodo(task3);
    return Column(
      children: [
        buildMyList()
      ]
    );
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
        onPressed: () {
          Navigator.of(context).pushNamed(NewTaskScreen.routeName);
        },
      ),
    );
  }
}
