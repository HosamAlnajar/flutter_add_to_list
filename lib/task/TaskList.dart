import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:to_do_list/services/todo_item.dart';

class TaskList extends StatefulWidget {
  String todo;

  TaskList({Key key, this.todo}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState(todo);
}

class _TaskListState extends State<TaskList> {
  List<TodoItem> todos = [
    TodoItem(title: 'First task', completed: true),
    TodoItem(title: 'Second task', completed: false),
    TodoItem(title: 'Third task', completed: true),
  ];

  String todo;
  String toDo;
  _TaskListState(this.todo);

  @override
  Widget build(BuildContext context) {
  
    setState(() {
      if (widget.todo != null) {
        toDo = widget.todo ?? '';
      }
    });

    void updateTodos(todo) {
      setState(() {
        todos.add(TodoItem(title: todo['title']));

        print(todos.length);
      });
    }

    if (toDo != null) {
      Map toDoo = json.decode(toDo);

      updateTodos(toDoo);
    }

    return Expanded(
        child: Container(
          child: ListView.builder(
              itemCount: todos.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 1.0, horizontal: 4.0),
                  child: TodoItem(
                    title: todos[index].title,
                    completed: todos[index].completed,
                  ),
                );
              }),
        ),
        flex: 5 // child:
        );
  }
}
