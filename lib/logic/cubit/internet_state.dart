// part of 'internet_cubit.dart';

// @immutable
// abstract class InternetState {}

// class InternetLoading extends InternetState {}

// class InternetConnected extends InternetState {
//   final ConnectionType connectionType;

//   InternetConnected({required this.connectionType});
// }

// class InternetDisconnected extends InternetState {
//   final ConnectionType connectionType;

//   InternetDisconnected({required this.connectionType});
// }

part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnectedWiFi extends InternetState {}

class InternetConnectedMobile extends InternetState {}

class InternetDisconnected extends InternetState {}
