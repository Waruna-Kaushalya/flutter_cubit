import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter_bloc_concepts/constants/enums.dart';
import 'package:flutter_bloc_concepts/presentation/screens/settings_screen.dart';

import '/logic/cubit/cubit_packages.dart';
import '/presentation/screens/screen_packages.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/homeroute';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<CounterCubit, CounterState>(
          listener: (context, state) {
            listnerFunction(state, context);
          },
        ),
        // BlocListener<InternetCubit, InternetState>(
        //   listener: (context, state) {
        //     if (state is InternetConnectedWiFi) {
        //       context.read<CounterCubit>().increment();
        //     } else if (state is InternetConnectedMobile) {
        //       context.read<CounterCubit>().decrement();
        //     }
        //   },
        // ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // const Text(
              //   "Counter Value",
              //   style: TextStyle(
              //     fontSize: 30,
              //     fontWeight: FontWeight.bold,
              //   ),
              // ),
              // BlocBuilder<InternetCubit, InternetState>(
              //   builder: (context, state) {
              //     if (state is InternetConnected &&
              //         state.connectionType == ConnectionType.wifi) {
              //       return const Text("WIFI");
              //     } else if (state is InternetConnected &&
              //         state.connectionType == ConnectionType.mobile) {
              //       return const Text("Mobile");
              //     } else if (state is InternetDisconnected) {
              //       return const Text("Disconnected");
              //     }
              //     return const CircularProgressIndicator();
              //   },
              // ),
              // BlocBuilder<CounterCubit, CounterState>(
              //   builder: (context, state) {
              //     return Text(
              //       state.counterValue.toString(),
              //       style: const TextStyle(
              //         fontSize: 50,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     );
              //   },
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
              Builder(builder: (context) {
                final counterState = context.watch<CounterCubit>().state;
                final intenetState = context.watch<InternetCubit>().state;
                if (intenetState is InternetConnected &&
                    intenetState.connectionType == ConnectionType.mobile) {
                  return CounterAndNetLabel(
                    counterState: counterState,
                    internetType: 'Mobile',
                  );
                } else if (intenetState is InternetConnected &&
                    intenetState.connectionType == ConnectionType.wifi) {
                  return CounterAndNetLabel(
                    counterState: counterState,
                    internetType: 'WiFi',
                  );
                } else {
                  return CounterAndNetLabel(
                    counterState: counterState,
                    internetType: 'Disconnected',
                  );
                }
              }),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: "decrement",
                    tooltip: "Decrement",
                    child: const Icon(Icons.remove),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                  ),
                  FloatingActionButton(
                    heroTag: "increment",
                    tooltip: "Increment",
                    child: const Icon(Icons.add),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SecondPage.routeName);
                },
                child: const Text("second page"),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.green,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ThirddPage.routeName);
                },
                child: const Text("Thrid page"),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.green,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SettingsScreen.routeName);
                },
                child: const Text("Settings Page"),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.orange,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void listnerFunction(CounterState state, BuildContext context) {
    if (state.wasIncremented == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Incremented"),
          duration: Duration(milliseconds: 300),
        ),
      );
    } else if (state.wasIncremented == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Decremet"),
          duration: Duration(milliseconds: 300),
        ),
      );
    }
  }
}

class CounterAndNetLabel extends StatelessWidget {
  const CounterAndNetLabel({
    Key? key,
    required this.counterState,
    required this.internetType,
  }) : super(key: key);

  final CounterState counterState;
  final String internetType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Counter:" + counterState.counterValue.toString(),
          style: textStyle(),
        ),
        Text(
          "Internet:" + internetType,
          style: textStyle(),
        ),
      ],
    );
  }

  TextStyle textStyle() => const TextStyle(color: Colors.black, fontSize: 30.0);
}
