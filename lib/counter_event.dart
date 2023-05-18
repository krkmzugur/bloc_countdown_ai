part of 'counter_bloc.dart';

abstract class CounterEvent extends Equatable {
  const CounterEvent();

  @override
  List<Object> get props => [];
}

class StartCountdownEvent extends CounterEvent {}

class ResetCountdownEvent extends CounterEvent {}

class DecrementCountEvent extends CounterEvent {}

class StartButtonCountdownEvent extends CounterEvent {}
