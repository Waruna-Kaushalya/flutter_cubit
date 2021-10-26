import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/presentation/screens/thrid_screen.dart';

import 'presentation/screens/home_screen.dart';
import 'presentation/screens/second_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _countercubit = CounterCubit();

  final CounterCubit _countercubitSecond = CounterCubit();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.routeName,
      routes: {
        MyHomePage.routeName: (context) => BlocProvider.value(
              value: _countercubit,
              child: const MyHomePage(),
            ),
        SecondPage.routeName: (context) => BlocProvider.value(
              value: _countercubitSecond,
              child: const SecondPage(),
            ),
        ThridPage.routeName: (context) => BlocProvider.value(
              value: _countercubit,
              child: const ThridPage(),
            ),
      },
      // home: const MyHomePage(),
    );
  }

  @override
  void dispose() {
    _countercubit.close();
    _countercubitSecond.close();
    super.dispose();
  }
}
