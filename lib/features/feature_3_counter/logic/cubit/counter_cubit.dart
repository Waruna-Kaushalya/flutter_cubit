import 'package:flutter_bloc_concepts/utility/exports.dart';

part 'counter_state.dart';

//! this is Counter cubit not depend on internet cubit
class CounterCubit extends Cubit<CounterState> with HydratedMixin {
  CounterCubit() : super(CounterState(counterValue: 0, wasIncremented: false));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  //store data in local strage as json using hydrated bloc package
  @override
  CounterState? fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  //retreve local storage state data as json
  @override
  Map<String, dynamic>? toJson(CounterState state) {
    return state.toMap();
  }
}




//! this is Counter cubit depend on internet cubit
// class CounterCubit extends Cubit<CounterState> with HydratedMixin {
//   final InternetCubit internetCubit;
//   late StreamSubscription internetStreamSubscription;

//   CounterCubit({
//     required this.internetCubit,
//   }) : super(CounterState(counterValue: 0, wasIncremented: false)) {
//     internetStreamSubscription = internetCubit.stream.listen((internetState) {
//       if (internetState is InternetConnected &&
//           internetState.connectionType == ConnectionType.wifi) {
//         increment();
//       } else if (internetState is InternetDisconnected) {
//         decrement();
//       }
//     });
//   }

//   void increment() => emit(
//       CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

//   void decrement() => emit(CounterState(
//       counterValue: state.counterValue - 1, wasIncremented: false));

//   //store data in local strage as json using hydrated bloc package
//   @override
//   CounterState? fromJson(Map<String, dynamic> json) {
//     return CounterState.fromMap(json);
//   }

//   //retreve local storage state data as json
//   @override
//   Map<String, dynamic>? toJson(CounterState state) {
//     return state.toMap();
//   }

//   @override
//   Future<void> close() {
//     internetStreamSubscription.cancel();
//     return super.close();
//   }
// }
