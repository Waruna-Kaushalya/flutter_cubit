import 'package:flutter_bloc_concepts/utility/exports.dart';

//An interface for observing the behavior of Bloc instances.
class AppBlocObserver extends BlocObserver {
  // @override
  // void onTransition(Bloc bloc, Transition transition) {
  //   super.onTransition(bloc, transition);
  // }
  // @override
  // void onChange(BlocBase bloc, Change change) {
  //   print(change);
  //   super.onChange(bloc, change);
  // }

  @override
  void onClose(BlocBase bloc) {
    print(bloc);

    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    print(bloc);
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(bloc);
    print(error);
    super.onError(bloc, error, stackTrace);
  }

  // @override
  // void onEvent(Bloc bloc, Object? event) {
  //   super.onEvent(bloc, event);
  // }

}
