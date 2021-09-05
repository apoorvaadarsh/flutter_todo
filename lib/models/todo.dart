class Todo {
  String? title;
  bool isCompleted;
  Todo({this.title, this.isCompleted = false});

  Todo.fromMap(Map map):
      this.title = map["title"],
      this.isCompleted = map["isCompleted"];

  Map toMap(){
    return{
      'title': this.title,
      'isCompleted': this.isCompleted
    };
  }
}
