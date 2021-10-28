import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '/logic/cubit/cubit_packages.dart';
import '/presentation/screens/screen_packages.dart';
import '/presentation/routes/app_routes.dart';

void main() {
  runApp(
    MyApp(appRoutes: AppRoutes(), connectivity: Connectivity()),
  );
}

class MyApp extends StatelessWidget {
  final AppRoutes appRoutes;
  final Connectivity connectivity;

  const MyApp({
    Key? key,
    required this.appRoutes,
    required this.connectivity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: connectivity),
        ),
        BlocProvider<CounterCubit>(
          create: (context) =>
              CounterCubit(internetCubit: context.read<InternetCubit>()),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: MyHomePage.routeName,
        onGenerateRoute: appRoutes.onGenerateRoute,
      ),
    );
  }
}
