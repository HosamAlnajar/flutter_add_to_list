import 'package:flutter/material.dart';
import 'package:to_do_list/pages/HomePage.dart';
import 'package:to_do_list/pages/create_todo_form.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        '/create': (context) => CreateTodoForm(),
      },
      title: 'TODO List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Scaffold(
        body: Container(
          child: Column(children: <Widget>[
            Expanded(
              child: Container(),
              flex: 1,
            ),
            Expanded(child: HomePage(), flex: 6),
          ]),
          decoration: BoxDecoration(
            image: DecorationImage(
                image:
                    AssetImage('assets/images/background/app-background.png'),
                fit: BoxFit.cover),
          ),
        ),
      ),
    );
  }
}
