import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';
part 'settingscubit_state.dart';

class SettingsCubit extends Cubit<SettingState> with HydratedMixin {
  SettingsCubit()
      : super(const SettingState(
            appNotification: false, emailNotification: false));

  void toggleAppNotification(bool newvalue) {
    emit(state.copyWith(appNotification: newvalue));
  }

  void toggleEmailNotifications(bool newValue) {
    emit(state.copyWith(emailNotification: newValue));
  }

  @override
  SettingState? fromJson(Map<String, dynamic> json) =>
      SettingState.fromMap(json);

  @override
  Map<String, dynamic>? toJson(SettingState state) => state.toMap();
  @override
  void onError(Object error, StackTrace stackTrace) {
    throw "Err";
    super.onError(error, stackTrace);
  }
}
