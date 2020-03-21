import 'package:flutter/material.dart';
import 'package:to_do_list/services/todo_list.dart';
import '../task/WelcomeBar.dart';
import '../task/TaskList.dart';

class HomeView extends StatelessWidget {
  TodoList instance = TodoList(title: 'new todo list',completed: false);
	@override
	Widget build(BuildContext context) {
		return Container(
			child: Column(
				children: <Widget>[
					WelcomeBar(
						name: 'Jose',
						avatar: 'assets/images/icons/avatar.png'
					),

					TaskList(),
          FloatingActionButton.extended(
            onPressed: () {
             print('addddkk lksdjflkjsf lskdfjlsdjf');
             instance.createTodo();
            },
            label: Text('Add todo'),
            icon: Icon(Icons.add),
            backgroundColor: Colors.pink,
          ),
      
				],
			),
			decoration: BoxDecoration(
				color: Colors.white,
				borderRadius: BorderRadius.only(topLeft: Radius.circular(30.0), topRight: Radius.circular(30.0))
			),
      
      
		);
	}
}