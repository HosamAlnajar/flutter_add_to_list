import 'package:flutter/material.dart';

class TodoItem extends StatelessWidget {
  String title;
  bool completed;

  TodoItem({this.title, this.completed = false});


  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: () {
          print('updated ++++++++');
          print(completed);
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
