import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';

import '../../models/todo.dart';

part 'todo_state.dart';

class TodoCubit extends Cubit<TodoState> {
  TodoCubit()
      : super(
          TodoInitial(
            [
              Todo(id: UniqueKey().toString(), title: "Go home", isDone: false),
              Todo(
                  id: UniqueKey().toString(),
                  title: "Go shopping",
                  isDone: false),
              Todo(
                  id: UniqueKey().toString(),
                  title: "Go swimming",
                  isDone: true),
            ],
          ),
        );

  void addTodo(String title) {
    final todo = Todo(id: UniqueKey().toString(), title: title, isDone: false);
    final todos = state.todos;
    todos.add(todo);
    emit(TodoAdded(todos));
  }
}
