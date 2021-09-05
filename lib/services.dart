import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_todo/models/todo.dart';

class Database {
  CollectionReference collection =
      FirebaseFirestore.instance.collection('todos');
  String documentId = "testing";

  Future addTodoToDatabase(List<Todo> todos) async {
    try {
      if (todos.length == 0) return;

      List<Map> todoList = [];
      // {
      //   "title" : aKJC,
      //   "isCompleted": cqac
      // }

      todos.forEach((todo) {
        todoList.add(todo.toMap());
      });

      Map<String, dynamic> data = {'list': todoList};

      print(data);

      await collection.doc(documentId).set(data);
    } catch (e) {
      print(e);
    }
  }

  Future getTodoToDatabase() async {
    try {
      DocumentSnapshot snapshot = await collection.doc(documentId).get();

      List<Todo> todos = [];

      if (snapshot.exists) {
        Map data = snapshot.data() as Map;

        data['list'].forEach((todo) {
          todos.add(
              Todo(title: todo['title'], isCompleted: todo['isCompleted']));
        });
      }

      return todos;
    } catch (e) {
      print(e);
    }
  }
}
