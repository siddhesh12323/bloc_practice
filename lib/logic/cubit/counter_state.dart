part of 'counter_cubit.dart';

// class CounterState {
//   int counterValue;
//   int isIncremented;
//   CounterState({required this.counterValue, required this.isIncremented});
// }

class CounterState extends Equatable {
  int counterValue;
  int isIncremented;
  CounterState({required this.counterValue, required this.isIncremented});
  
  @override
  List<Object?> get props => [counterValue, isIncremented];
}
