import 'dart:convert';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  CounterState? fromJson(Map<String, dynamic> json) =>
      CounterState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(CounterState state) => state.toMap();
}