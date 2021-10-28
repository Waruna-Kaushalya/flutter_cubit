import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
    return BlocListener<CounterCubit, CounterState>(
      listener: (context, state) {
        listnerFunction(state, context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Counter Value",
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, state) {
                  if (state is InternetConnectedWiFi) {
                    return const Text("WIFI");
                  } else if (state is InternetConnectedMobile) {
                    return const Text("Mobile");
                  } else if (state is InternetDisconnected) {
                    return const Text("Disconnected");
                  }
                  return const CircularProgressIndicator();
                },
              ),
              BlocBuilder<CounterCubit, CounterState>(
                builder: (context, state) {
                  return Text(
                    state.counterValue.toString(),
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
              // const SizedBox(
              //   height: 20,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.center,
              //   children: [
              //     FloatingActionButton(
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).decrement();
              //       },
              //       tooltip: "Decrement",
              //       child: const Icon(Icons.remove),
              //       heroTag: null,
              //     ),
              //     const SizedBox(
              //       width: 10,
              //     ),
              //     FloatingActionButton(
              //       onPressed: () {
              //         BlocProvider.of<CounterCubit>(context).increment();
              //       },
              //       tooltip: "Increment",
              //       child: const Icon(Icons.add),
              //       heroTag: null,
              //     ),
              //   ],
              // ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SecondPage.routeName);
                },
                child: const Text("second page"),
                style: TextButton.styleFrom(
                    primary: Colors.black, backgroundColor: Colors.green),
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
                    primary: Colors.black, backgroundColor: Colors.green),
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
