part of 'home_bloc.dart';

class HomeState extends Equatable {
  final int counter;
  const HomeState({this.counter = 0});

  HomeState copyWith({int? counter}) {
    return HomeState(counter: counter ?? this.counter);
  }

  @override
  List<Object> get props => [counter];
}

