import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_counter_event.dart';
part 'my_counter_state.dart';

class MyCounterBloc extends Bloc<MyCounterEvent, MyCounterState> {
  MyCounterBloc() : super(MyCounterInitialState()) {
    on<MyCounterIncrementEvent>(myCounterIncrementEvent);
  }
  int val = -1;
  FutureOr<void> myCounterIncrementEvent(
      MyCounterIncrementEvent event, Emitter<MyCounterState> emit) {
    emit(MyCounterIncrementState(value: val));
    val = val + 1;
  }
}
