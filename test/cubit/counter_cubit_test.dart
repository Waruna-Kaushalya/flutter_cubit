import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:flutter_test/flutter_test.dart';

main() {
  group('CounterCubit', () {
    late CounterCubit counterCubit;

    setUp(() {
      counterCubit = CounterCubit();
    });
    tearDown(() {
      counterCubit.close();
    });
    test("initial state counterValue is 0", () {
      expect(counterCubit.state,
          CounterState(counterValue: 0, wasIncremented: false));
    });
    // blocTest(
    //   "CubitState should +1",
    //   build: () => CounterCubit(),
    //   act: (cubit) {
    //     cubit.increment();
    //   },
    //   expect: () => CounterState(counterValue: 1, wasIncremented: true),
    // );
  });
}
