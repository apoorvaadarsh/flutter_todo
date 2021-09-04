import 'package:flutter/material.dart';
import 'package:flutter_todo/screens/homescreen.dart';
import 'package:flutter_todo/screens/new_task_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: HomeScreen(),
      routes: {
        NewTaskScreen.routeName: (context) => NewTaskScreen(),
      },
    );
  }
}



  
