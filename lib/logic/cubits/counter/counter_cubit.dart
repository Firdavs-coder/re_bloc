import 'package:bloc/bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  CounterCubit() : super(CounterInitial(0));

  void increment() async {
    emit(CounterLoading());
    await Future.delayed(const Duration(seconds: 2));
    emit(CounterCounted(state.number! + 1));
  }
}
