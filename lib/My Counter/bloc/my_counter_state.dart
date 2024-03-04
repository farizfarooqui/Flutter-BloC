part of 'my_counter_bloc.dart';

abstract class MyCounterState {}

final class MyCounterInitialState extends MyCounterState {}

class MyCounterIncrementState extends MyCounterState {
  final int value;

  MyCounterIncrementState({required this.value});
}
