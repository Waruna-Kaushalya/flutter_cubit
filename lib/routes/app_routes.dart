import 'package:flutter_bloc_concepts/utility/exports.dart';

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
