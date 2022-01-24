import 'package:flutter_bloc_concepts/utility/exports.dart';

class InternetConnectionTestScreen extends StatefulWidget {
  static const routeName = '/internetConnectionScreen';

  const InternetConnectionTestScreen({Key? key}) : super(key: key);

  @override
  _InternetConnectionTestScreenState createState() =>
      _InternetConnectionTestScreenState();
}

class _InternetConnectionTestScreenState
    extends State<InternetConnectionTestScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Internet Check"),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.pushNamed(context, SettingsScreen.routeName);
              },
              icon: const Icon(Icons.settings))
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("Internt Connection"),
            BlocBuilder<InternetCubit, InternetState>(
              builder: (context, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.wifi) {
                  return const Text("Wifi");
                } else if (state is InternetDisconnected) {
                  return const Text("Disconnected");
                }
                return const CircularProgressIndicator();
              },
            )
          ],
        ),
      ),
    );
  }
}
