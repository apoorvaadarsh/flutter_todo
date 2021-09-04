import 'package:flutter/material.dart';
import 'package:flutter_todo/models/todo.dart';
import 'package:flutter_todo/screens/new_task_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<Todo> list = [];

  //----------------------------------------------------------------------------

  void goToNewItemView() async {
    // Here we are pushing the new view into the Navigator stack. By using a
    // MaterialPageRoute we get standard behaviour of a Material app, which will
    // show a back button automatically for each platform on the left top corner
    MaterialPageRoute newItemView =
        MaterialPageRoute(builder: (context) => NewTaskScreen());

    dynamic result = await Navigator.of(context).push(newItemView);

    if (result != null) addItem(Todo(title: result.toString()));
  }

  void goToEditItemView(item) async {
    // We re-use the NewTodoView and push it to the Navigator stack just like
    // before, but now we send the title of the item on the class constructor
    // and expect a new title to be returned so that we can edit the item

    MaterialPageRoute editItemView =
        MaterialPageRoute(builder: (context) => NewTaskScreen(item: item));

    dynamic result = await Navigator.of(context).push(editItemView);

    if (result != null)
      setState(() {
        editItem(item, result.toString());
      });
  }

  //----------------------------------------------------------------------------

  void addItem(Todo item) async {
    setState(() {
      list.add(item);
    });
  }

  void editItem(Todo item, String title) async {
    item.title = title;
  }

  void removeItem(Todo item) async {
    setState(() {
      list.remove(item);
    });
  }

  void markAsDone(Todo item) async {
    setState(() {
      item.isCompleted = !item.isCompleted;
    });
  }

  //----------------------------------------------------------------------------

  Widget buildListView() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) =>
          buildItem(list[index], index),
    );
  }

  Widget buildItem(Todo item, index) {
    return Dismissible(
      key: Key('${item.hashCode}'),
      background: Container(
        padding: EdgeInsets.all(5),
        color: Colors.red[700],
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        alignment: Alignment.centerLeft,
      ),
      onDismissed: (direction) => removeItem(item),
      direction: DismissDirection.startToEnd,
      child: buildListItem(item, index),
    );
  }

  Widget buildListItem(Todo item, int index) {
    return ListTile(
      onTap: () => markAsDone(item),
      onLongPress: () => goToEditItemView(item),
      leading: Text((index + 1).toString()),
      title: Text(
        item.title!,
        key: Key('item-$index'),
      ),
      trailing: Icon(
        item.isCompleted ? Icons.check_box : Icons.check_box_outline_blank,
        key: Key('completed-icon-$index'),
      ),
    );
  }
  //----------------------------------------------------------------------------

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo Tasks'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: buildListView(),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () => goToNewItemView(),
      ),
    );
  }
  //----------------------------------------------------------------------------

}
