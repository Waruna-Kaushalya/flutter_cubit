import 'package:flutter_bloc_concepts/utility/exports.dart';
part 'settingscubit_state.dart';

class SettingsCubit extends Cubit<SettingState> with HydratedMixin {
  SettingsCubit()
      : super(const SettingState(
          appNotification: false,
          emailNotification: false,
        ));

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

  // @override
  // void onError(Object error, StackTrace stackTrace) {
  //   throw "Err";
  //   // super.onError(error, stackTrace);
  // }
}
