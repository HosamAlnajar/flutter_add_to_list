import 'package:flutter/material.dart';
import 'package:to_do_list/services/todo_item.dart';

class TaskList extends StatefulWidget {
  final List todos;

  TaskList({Key key, this.todos}) : super(key: key);

  @override
  _TaskListState createState() => _TaskListState(todos);
}

class _TaskListState extends State<TaskList> {
  List todos;
  
  _TaskListState(this.todos);

  void makeTodoCompleted(index) {
    print(index);
    setState(() {
      todos[index].completed = !todos[index].completed;
    });
  }

  @override
  Widget build(BuildContext context) {
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
                    index: index,
                    makeTodoCompleted: makeTodoCompleted,
                  ),
                );
              }),
        ),
        flex: 5 // child:
        );
  }
}
