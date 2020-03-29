import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:to_do_list/pages/create_todo_form.dart';
import 'package:to_do_list/services/todo_item.dart';
import '../task/WelcomeBar.dart';
import '../task/TaskList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map todo;

  List<TodoItem> todos = [
    TodoItem(index: 0, title: 'First task', completed: true),
    TodoItem(index: 1, title: 'Second task', completed: false),
    TodoItem(index: 2, title: 'Third task', completed: true),
  ];

  _navigateAndDisplaySelection(BuildContext context) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateTodoForm()),
    );

    setState(() {
      String todoo = jsonEncode(result);

      todo = json.decode(todoo);

      todos.add(TodoItem(title: todo['title']));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          WelcomeBar(name: 'Hosam', avatar: 'assets/images/icons/avatar.png'),
          TaskList(todos: todos),
          FloatingActionButton(
            onPressed: () => _navigateAndDisplaySelection(context),
            tooltip: 'Add task',
            child: Icon(Icons.add),
            backgroundColor: Colors.pink,
          )
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))),
    );
  }
}
