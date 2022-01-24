import 'package:flutter_bloc_concepts/utility/exports.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settingsscreenroute';

  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Settings"),
      ),
      body: BlocConsumer<SettingsCubit, SettingState>(
        listener: (context, state) {
          notificationSnackbar(context, state);
        },
        builder: (context, state) {
          return BlocBuilder<SettingsCubit, SettingState>(
            builder: (context, state) {
              return Column(
                children: [
                  SwitchListTile(
                    title: const Text("App Notification"),
                    value: state.appNotification,
                    onChanged: (newvalue) {
                      context
                          .read<SettingsCubit>()
                          .toggleAppNotification(newvalue);
                    },
                  ),
                  SwitchListTile(
                    title: const Text("Email Notification"),
                    value: state.emailNotification,
                    onChanged: (newValue) {
                      context
                          .read<SettingsCubit>()
                          .toggleEmailNotifications(newValue);
                    },
                  ),
                ],
              );
            },
          );
        },
      ),
    );
  }

  void notificationSnackbar(BuildContext context, SettingState state) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(
        "App" +
            state.appNotification.toString().toUpperCase() +
            ",Email" +
            state.emailNotification.toString().toUpperCase(),
      ),
      duration: const Duration(milliseconds: 300),
    ));
  }
}
