import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/thrid_screen.dart';

class AppRoutes {
  Route? onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case MyHomePage.routeName:
        return MaterialPageRoute(
          builder: (context) => const MyHomePage(),
        );

      case SecondPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const SecondPage(),
        );

      case ThridPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ThridPage(),
        );

      default:
        return null;
    }
  }
}
