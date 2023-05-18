part of 'counter_bloc.dart';

class CounterState extends Equatable {
  final int count;
  final String buttonText;

  const CounterState({required this.buttonText, required this.count});

  CounterState copyWith({int? count, String? buttonText}) {
    return CounterState(
        count: count ?? this.count, buttonText: buttonText ?? this.buttonText);
  }

  @override
  List<Object> get props => [count, buttonText];
}
