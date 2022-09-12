import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(CounterInitial(0)) {
    on<CounterEvent>(
      (event, emit) async {
        if (event is CounterIncrementEvent) {
          emit(CounterLoading(state.number));
          await Future.delayed(const Duration(seconds: 2));
          emit(CounterCounted(state.number + 1));
        }
      },
    );
  }
}
