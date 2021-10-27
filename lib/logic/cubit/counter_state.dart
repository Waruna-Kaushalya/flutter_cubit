part of 'counter_cubit.dart';

class CounterState {
  int counterValue;
  bool wasIncremented;
  CounterState({
    required this.counterValue,
    required this.wasIncremented,
  });

  @override
  // TODO: implement props
  List<Object?> get props => [counterValue, wasIncremented];
}
