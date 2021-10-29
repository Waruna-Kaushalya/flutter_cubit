part of 'internet_cubit.dart';

@immutable
abstract class InternetState {}

class InternetLoading extends InternetState {}

class InternetConnectedWiFi extends InternetState {}

class InternetConnectedMobile extends InternetState {}

class InternetDisconnected extends InternetState {}
