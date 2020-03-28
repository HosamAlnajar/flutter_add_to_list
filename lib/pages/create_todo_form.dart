import 'package:flutter/material.dart';

class CreateTodoForm extends StatefulWidget {
  @override
  _CreateTodoFormState createState() => _CreateTodoFormState();
}

class _CreateTodoFormState extends State<CreateTodoForm> {
  final _formKey = GlobalKey<FormState>();

  String todo = '';

  @override
  Widget build(BuildContext context) {
    // Build a Form widget using the _formKey created above.
    return Scaffold(
      appBar: AppBar(
        title: Text("Add new Todo"),
      ),
      body: Builder(builder: (BuildContext context) {
        return Center(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  onChanged: (val) {
                    setState(() => todo = val);
                  },
                  validator: (value) {
                    if (value.isEmpty) {
                      return 'Please enter some text';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: RaisedButton(
                    onPressed: () {
                      

                      if (_formKey.currentState.validate()) {
                        Navigator.pop(context,{
                          'title' : todo,
                        });
                        // If the form is valid, display a Snackbar.
                        Scaffold.of(context).showSnackBar(
                          SnackBar(
                            content: Text(
                              'Saving Todo...',
                            ),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Add',
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.pink[400],
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
