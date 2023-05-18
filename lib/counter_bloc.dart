import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'counter_event.dart';
part 'counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  late Timer _timer;
  bool _isCountdownActive = false;

  CounterBloc() : super(CounterState(buttonText: 'Start', count: 10)) {
    on<StartCountdownEvent>((event, emit) async {
      if (_isCountdownActive) {
        _timer.cancel();
        _isCountdownActive = false;
        add(StartButtonCountdownEvent());
      } else {
        _timer = await Timer.periodic(Duration(seconds: 1), (timer) {
          if (state.count == 0) {
            timer.cancel();
            add(ResetCountdownEvent());
          } else {
            add(DecrementCountEvent());
          }
        });
        _isCountdownActive = true;
      }
    });

    on<StartButtonCountdownEvent>((event, emit) {
      emit(CounterState(count: state.count, buttonText: 'Start'));
    });

    on<DecrementCountEvent>((event, emit) {
      emit(CounterState(count: state.count - 1, buttonText: 'Pause'));
    });

    on<ResetCountdownEvent>((event, emit) {
      emit(CounterState(count: 10, buttonText: 'Start'));
    });
  }

  @override
  Future<void> close() {
    _timer.cancel();
    return super.close();
  }
}
