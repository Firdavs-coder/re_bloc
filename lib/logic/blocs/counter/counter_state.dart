// ignore_for_file: non_constant_identifier_names
part of 'counter_bloc.dart';

abstract class CounterState {
  late int number;
  CounterState(this.number);
}

class CounterInitial extends CounterState {
  CounterInitial(int starting_number) : super(starting_number);
}

class CounterLoading extends CounterState {
  CounterLoading(int number) : super(number);
}

class CounterCounted extends CounterState {
  CounterCounted(int new_number) : super(new_number);
}

class CounterError extends CounterState {
  final String error_message;

  CounterError(this.error_message, int number) : super(number);
}
