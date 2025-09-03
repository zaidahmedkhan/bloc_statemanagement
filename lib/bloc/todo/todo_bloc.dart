import 'package:bloc_demo/bloc/todo/todo_events.dart';
import 'package:bloc_demo/bloc/todo/todo_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class TodoBloc extends Bloc<TodoEvents, TodoStates> {
  final List<String> todoList = [];
  TodoBloc() : super(const TodoStates()) {
    on<AddTodoEvent>(_addTodoEvent);
    on<RemoveTodoEvent>(_removeTodoEvent);
  }

  void _addTodoEvent(AddTodoEvent event, Emitter<TodoStates> emit) {
    todoList.add(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }

  void _removeTodoEvent(RemoveTodoEvent event, Emitter<TodoStates> emit) {
    todoList.remove(event.task);
    emit(state.copyWith(todoList: List.from(todoList)));
  }
}
