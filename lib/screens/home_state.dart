import 'package:flutter/material.dart';
import 'package:todolist/models/todo.dart';

class HomeState extends ChangeNotifier {
  final todoslist = Todo.todolist();

  final TextEditingController _newtodo = TextEditingController();

  void displayNewTodo(BuildContext context) async {
    await showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: TextField(
          controller: _newtodo,
          decoration: const InputDecoration(
            hintText: 'New Todo',
          ),
        ),
        actions: [
          ElevatedButton(
            onPressed: () {
              if (_newtodo.text.isNotEmpty) {
                todoslist.add(
                  Todo(
                    todoText: _newtodo.text,
                    id: DateTime.now().toString(),
                  ),
                );
                _newtodo.clear();
                Navigator.of(context).pop();
                notifyListeners();
              }
            },
            child: const Text('Save'),
          ),
        ],
      ),
    );
  }

  void removeTodoItem(int index) {
    todoslist.removeAt(index);
    notifyListeners();
  }
}
