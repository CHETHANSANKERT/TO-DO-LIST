import 'package:flutter/material.dart';
import 'package:todolist/models/todo.dart';

class Todoitem extends StatefulWidget {
  final Todo todo;
  final Function onDismissed;

  const Todoitem({super.key, required this.todo, required this.onDismissed});

  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key(widget.todo.id), // Use the todo's id as the key
      direction: DismissDirection.endToStart,
      onDismissed: (direction) {
        widget.onDismissed();
      },
      background: Container(
        alignment: Alignment.centerRight,
        color: Colors.red,
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: const Icon(Icons.delete, color: Colors.white),
      ),
      child: Container(
        margin: const EdgeInsets.only(bottom: 8),
        child: ListTile(
          onTap: () {
            setState(() {
              widget.todo.isdone = !widget.todo.isdone;
            });
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          tileColor: Colors.white,
          leading: widget.todo.isdone
              ? const Icon(
            Icons.check_box,
            color: Colors.indigo,
          )
              : const Icon(
            Icons.check_box_outline_blank,
          ),
          title: Text(
            widget.todo.todoText,
            style: TextStyle(
              fontSize: 20,
              color: Colors.black,
              decoration: widget.todo.isdone ? TextDecoration.lineThrough : null,
            ),
          ),
        ),
      ),
    );
  }
}
