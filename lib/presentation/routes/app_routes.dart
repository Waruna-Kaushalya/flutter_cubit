import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/thrid_screen.dart';

class AppRoutes {
  final CounterCubit _counterCubit = CounterCubit();
  final CounterCubit _counterCubitSecond = CounterCubit();

  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case MyHomePage.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: const MyHomePage(),
          ),
        );

      case SecondPage.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubitSecond,
            child: const SecondPage(),
          ),
        );

      case ThridPage.routeName:
        return MaterialPageRoute(
          builder: (context) => BlocProvider.value(
            value: _counterCubit,
            child: const ThridPage(),
          ),
        );

      default:
        return null;
    }
  }

  void dispose() {
    _counterCubit.close();
    _counterCubitSecond.close();
  }
}
