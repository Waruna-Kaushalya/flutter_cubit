import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/presentation/screens/home_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/second_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/settings_screen.dart';
import 'package:flutter_bloc_concepts/presentation/screens/third_screen.dart';

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

      case ThirddPage.routeName:
        return MaterialPageRoute(
          builder: (context) => const ThirddPage(),
        );
      case SettingsScreen.routeName:
        return MaterialPageRoute(
          builder: (context) => const SettingsScreen(),
        );
      default:
        return null;
    }
  }
}
