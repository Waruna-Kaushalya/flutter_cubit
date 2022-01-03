import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/logic/cubit/settingscubit_cubit.dart';
import 'package:flutter_bloc_concepts/logic/utility/app_bloc_observer.dart';
import 'package:path_provider/path_provider.dart';

import '/logic/cubit/cubit_packages.dart';
import '/presentation/screens/screen_packages.dart';
import '/presentation/routes/app_routes.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();

//   HydratedBloc.storage = await HydratedStorage.build(
//     storageDirectory: await getApplicationDocumentsDirectory(),
//   );

//   Bloc.observer = AppBlocObserver();
//   runApp(
//     MyApp(appRoutes: AppRoutes(), connectivity: Connectivity()),
//   );
// }

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final storage = await HydratedStorage.build(
    storageDirectory: await getApplicationDocumentsDirectory(),
  );

  final observer = AppBlocObserver();

  HydratedBlocOverrides.runZoned(
      () => runApp(MyApp(appRoutes: AppRoutes(), connectivity: Connectivity())),
      storage: storage,
      blocObserver: observer);
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
          create: (context) => CounterCubit(),
        ),
        BlocProvider<SettingsCubit>(
          create: (context) => SettingsCubit(),
        )
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
