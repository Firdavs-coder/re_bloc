part of 'todo_cubit.dart';

@immutable
abstract class TodoState {
  final List<Todo> todos;
  const TodoState(this.todos);
}

class TodoInitial extends TodoState {
  @override
  final List<Todo> todos;
  const TodoInitial(this.todos) : super(todos);
}

class TodoAdded extends TodoState {
  const TodoAdded(List<Todo> todos) : super(todos);
}
