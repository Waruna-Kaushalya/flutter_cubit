part of 'settingscubit_cubit.dart';

class SettingState extends Equatable {
  final bool appNotification;
  final bool emailNotification;

  const SettingState({
    required this.appNotification,
    required this.emailNotification,
  });

  SettingState copyWith({
    bool? appNotification,
    bool? emailNotification,
  }) {
    return SettingState(
      appNotification: appNotification ?? this.appNotification,
      emailNotification: emailNotification ?? this.emailNotification,
    );
  }

  @override
  List<Object?> get props => [appNotification, emailNotification];

  Map<String, dynamic> toMap() {
    return {
      'appNotification': appNotification,
      'emailNotification': emailNotification,
    };
  }

  factory SettingState.fromMap(Map<String, dynamic> map) {
    return SettingState(
      appNotification: map['appNotification'],
      emailNotification: map['emailNotification'],
    );
  }

  String toJson() => json.encode(toMap());

  factory SettingState.fromJson(String source) =>
      SettingState.fromMap(json.decode(source));

  @override
  String toString() =>
      'SettingState(appNotification: $appNotification, emailNotification: $emailNotification)';
}
