class Todo {
  String id;
  String todoText;
  bool isdone;

  Todo({
    required this.id,
    required this.todoText,
    this.isdone = false,
  });

  static List<Todo> todolist() {
    return [
      Todo(id: '1', todoText: 'Morning Exercise', isdone: true),
      Todo(id: '2', todoText: 'Breakfast'),
      Todo(id: '3', todoText: 'GET A JOB'),
    ];
  }
}
