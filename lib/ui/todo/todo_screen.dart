import 'package:bloc_demo/bloc/todo/todo_bloc.dart';
import 'package:bloc_demo/bloc/todo/todo_events.dart';
import 'package:bloc_demo/bloc/todo/todo_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoScreen extends StatefulWidget {
  const TodoScreen({super.key});

  @override
  State<TodoScreen> createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(centerTitle: true, title: Text("Todo App")),
      body: BlocBuilder<TodoBloc, TodoStates>(
        builder: (context, states) {
          if (states.todoList.isEmpty) {
            return const Center(child: Text("No Todo found"));
          } else if (states.todoList.isNotEmpty) {
            return ListView.builder(
              itemCount: states.todoList.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(states.todoList[index]),
                  trailing: IconButton(
                    onPressed: () {
                      context.read<TodoBloc>().add(
                        RemoveTodoEvent(task: states.todoList[index]),
                      );
                    },
                    icon: Icon(Icons.delete),
                  ),
                );
              },
            );
          } else {
            return SizedBox();
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          for (int i = 0; i < 10; i++) {
            context.read<TodoBloc>().add(AddTodoEvent(task: "Task: $i"));
          }
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
