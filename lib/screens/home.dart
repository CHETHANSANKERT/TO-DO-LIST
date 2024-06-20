import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todolist/screens/home_state.dart';
import 'package:todolist/widget/todoitem.dart';
import 'package:todolist/models/todo.dart';


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => HomeState(),
      builder: (context, Widget? _) => Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFFEEEFF5),
          title: const Center(
            child: Text(
              'To-Do-List',
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        body: const HomeBody(),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Provider.of<HomeState>(context, listen: false).displayNewTodo(context);
          },
          child: const Icon(Icons.add),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      ),
    );
  }
}

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Todo> todoslist = Provider.of<HomeState>(context).todoslist;

    return Center(
      child: Container(
        margin: const EdgeInsets.all(10),
        child: ListView.builder(
          itemCount: todoslist.length,
          itemBuilder: (context, index) {
            final todoo = todoslist[index];
            return Todoitem(
              todo: todoo,
              onDismissed: () => Provider.of<HomeState>(context, listen: false).removeTodoItem(index),
            );
          },
        ),
      ),
    );
  }
}
