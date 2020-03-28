import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:to_do_list/pages/create_todo_form.dart';
import '../task/WelcomeBar.dart';
import '../task/TaskList.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String todo;

  _navigateAndDisplaySelection(BuildContext context) async {
    
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => CreateTodoForm()),
    );
    setState(() {
      todo = jsonEncode(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          WelcomeBar(name: 'Hosam', avatar: 'assets/images/icons/avatar.png'),
          TaskList(todo: todo),
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
