import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
part 'settingscubit_state.dart';

class SettingsCubit extends Cubit<SettingState> {
  SettingsCubit()
      : super(SettingState(appNotification: false, emailNotification: false));

  void toggleAppNotification(bool newvalue) {
    emit(state.copyWith(appNotification: newvalue));
  }

  void toggleEmailNotifications(bool newValue) {
    emit(state.copyWith(emailNotification: newValue));
  }
}
