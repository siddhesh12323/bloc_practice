import 'dart:async';
import 'package:bloc_part_1/constants/enums.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'internet_cubit.dart';

part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  StreamSubscription? internetStreamSubscription;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0, isIncremented: 2)) {
    monitorInternetSubscription();
  }

  void monitorInternetSubscription() {
    internetStreamSubscription = internetCubit.stream.listen((internetState) {
      if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.WiFi) {
        increment();
      } else if (internetState is InternetConnected &&
          internetState.connectionType == ConnectionType.Mobile) {
        decrement();
      }
    });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, isIncremented: 1));

  void decrement() => emit(
      CounterState(counterValue: state.counterValue - 1, isIncremented: -1));

  void clear() => emit(
      CounterState(counterValue: state.counterValue = 0, isIncremented: 0));

  @override
  Future<void> close() {
    internetStreamSubscription!.cancel();
    return super.close();
  }
}

// class CounterCubit extends Cubit<CounterState> {
//   CounterCubit() : super(CounterState(counterValue: 0, isIncremented: 2));

//   void increment() => emit(CounterState(counterValue: state.counterValue + 1, isIncremented: 1));

//   void decrement() => emit(CounterState(counterValue: state.counterValue - 1, isIncremented: -1));

//   void clear() => emit(CounterState(counterValue: state.counterValue = 0, isIncremented: 0));
// }