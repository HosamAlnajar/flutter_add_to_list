import 'package:flutter/material.dart';
import 'package:to_do_list/task/TaskList.dart';

class TodoItem extends StatelessWidget {
  String title;
  bool completed;
  int index;
  final Function makeTodoCompleted;
  TodoItem({this.index, this.title, this.completed = false, this.makeTodoCompleted});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print(index);
          print('updated ++++++++');
          print(completed);
         
          makeTodoCompleted(index);
        },
        title: Text(
          title,
          style: TextStyle(
              fontSize: 16.0,
              color: completed ? Colors.grey[300] : Colors.black,
              fontWeight: FontWeight.bold),
        ),
        leading: Image(
            image: completed
                ? AssetImage('assets/images/icons/completed.png')
                : AssetImage('assets/images/icons/non-completed.png')),
      ),
    );
  }
}
