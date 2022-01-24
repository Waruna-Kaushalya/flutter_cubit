import 'package:flutter_bloc_concepts/utility/exports.dart';
part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  // final Connectivity connectivity = Connectivity();

  //?connectivity_plus plugin dependency and pasing it
  //?required parramerter as constructor
  final Connectivity connectivity;

  //? You can also listen for network state changes by subscribing to the stream exposed by connectivity plugin
  //? Be sure to cancel subscription after you are done
  late StreamSubscription connectivityStreamSubscription;

  InternetCubit({required this.connectivity}) : super(InternetLoading()) {
    //? Got a new connectivity status!
    connectivityStreamSubscription =
        connectivity.onConnectivityChanged.listen((connectivityResult) {
      if (connectivityResult == ConnectivityResult.wifi) {
        emitInternetConnectedWiFi(ConnectionType.wifi);
      } else if (connectivityResult == ConnectivityResult.mobile) {
        emitInternetConnectedMobile(ConnectionType.mobile);
      } else if (connectivityResult == ConnectivityResult.none) {
        emitInternetDisconnected();
      }
    });
  }

  void emitInternetConnectedWiFi(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetConnectedMobile(ConnectionType connectionType) =>
      emit(InternetConnected(connectionType: connectionType));

  void emitInternetDisconnected() => emit(InternetDisconnected());

  //?Be sure to cancel subscription after you are done
  @override
  Future<void> close() {
    connectivityStreamSubscription.cancel();
    return super.close();
  }
}
