import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TodoListPage extends StatelessWidget {
  const TodoListPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('TODO')),
      body: ListView(
        children: [
          CheckboxListTile(
            title: const Text('todo'),
            value: true,
            onChanged: (value) => print('test'),
          ),
        ],
      ),
    );
  }
}
