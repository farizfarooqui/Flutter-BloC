import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeState()) {
    on<IncrementCounterEvent>(incrementCounterEvent);
    on<DecrementCounterEvent>(decrementCounterEvent);
  }

  FutureOr<void> incrementCounterEvent(
      IncrementCounterEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(counter: state.counter + 1));
    print('Increment event');
  }

  FutureOr<void> decrementCounterEvent(
      DecrementCounterEvent event, Emitter<HomeState> emit) {
    emit(state.copyWith(counter: state.counter - 1));
    print('Decrement Event');
  }
}
