import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/feature_1_settings/presentation/settings_screen.dart';
import 'package:flutter_bloc_concepts/feature_3_counter/presentation/home_screen.dart';
import 'package:flutter_bloc_concepts/feature_3_counter/presentation/second_screen.dart';
import 'package:flutter_bloc_concepts/feature_3_counter/presentation/third_screen.dart';

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
