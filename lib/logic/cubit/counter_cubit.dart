import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter_bloc_concepts/constants/enums.dart';
import 'package:flutter_bloc_concepts/logic/cubit/internet_cubit.dart';
part 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  final InternetCubit internetCubit;
  late StreamSubscription internetStreamSubscription;

  CounterCubit({required this.internetCubit})
      : super(CounterState(counterValue: 0, wasIncremented: false)) {
    internetStreamSubscription = internetCubit.stream.listen((internetstate) {
      if (internetstate is InternetConnected &&
          internetstate.connectionType == ConnectionType.wifi) {
        increment();
      } else if (internetstate is InternetConnected &&
          internetstate.connectionType == ConnectionType.mobile) {
        decrement();
      }
    });
  }

  void increment() => emit(
        CounterState(
          counterValue: state.counterValue + 1,
          wasIncremented: true,
        ),
      );

  void decrement() => emit(
        CounterState(
          counterValue: state.counterValue - 1,
          wasIncremented: false,
        ),
      );

  @override
  Future<void> close() {
    internetStreamSubscription.cancel();
    return super.close();
  }
}
