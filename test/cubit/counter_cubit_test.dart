import 'package:bloc_part_1/logic/cubit/counter_cubit.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('CounterCubit', () {
    CounterCubit counterCubit = CounterCubit();

    setUp(() => counterCubit = CounterCubit());

    tearDown(() => counterCubit.close());

    test('the initial state for the counterCubit is 0', () {
      expect(
          counterCubit.state, CounterState(counterValue: 0, isIncremented: 2));
    });

    blocTest(
      'Cubit should emit a CounterState(counterValue: 1, isIncremented: 1) when increment() is called',
      build: () => counterCubit,
      act: (cubit) => cubit.increment(),
      expect: () => [CounterState(counterValue: 1, isIncremented: 1)],
    );

    blocTest(
      'Cubit should emit a CounterState(counterValue: -1, isIncremented: -1) when decrement() is called',
      build: () => counterCubit,
      act: (cubit) => cubit.decrement(),
      expect: () => [CounterState(counterValue: -1, isIncremented: -1)],
    );

    blocTest(
      'Cubit should emit a CounterState(counterValue: 0, isIncremented: 0) when clear() is called',
      build: () => counterCubit,
      act: (cubit) => cubit.clear(),
      expect: () => [CounterState(counterValue: 0, isIncremented: 0)],
    );
  });
}
