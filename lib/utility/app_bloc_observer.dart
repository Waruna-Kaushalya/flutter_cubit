import 'package:flutter_bloc_concepts/utility/exports.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    // TODO: implement onChange
    print(change);
    super.onChange(bloc, change);
  }

  @override
  void onClose(BlocBase bloc) {
    // TODO: implement onClose
    print(bloc);

    super.onClose(bloc);
  }

  @override
  void onCreate(BlocBase bloc) {
    // TODO: implement onCreate
    print(bloc);
    super.onCreate(bloc);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    // TODO: implement onError
    print(bloc);
    print(error);
    super.onError(bloc, error, stackTrace);
  }

  @override
  void onEvent(Bloc bloc, Object? event) {
    // TODO: implement onEvent
    super.onEvent(bloc, event);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    // TODO: implement onTransition
    super.onTransition(bloc, transition);
  }
}
