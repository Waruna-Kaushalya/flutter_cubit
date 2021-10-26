import 'package:flutter/material.dart';
import 'package:flutter_bloc_concepts/presentation/routes/app_routes.dart';
import 'presentation/screens/home_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRoutes _appRoutes = AppRoutes();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: MyHomePage.routeName,
      onGenerateRoute: _appRoutes.onGenerateRoute,
    );
  }
}
