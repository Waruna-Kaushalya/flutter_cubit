import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_concepts/feature_1_settings/logic/cubit/settingscubit_cubit.dart';
import 'package:flutter_bloc_concepts/feature_2_conectivity/logic/cubit/internet_cubit.dart';
import 'package:flutter_bloc_concepts/feature_3_counter/logic/cubit/counter_cubit.dart';
import 'package:flutter_bloc_concepts/feature_3_counter/presentation/home_screen.dart';

import 'package:flutter_bloc_concepts/routes/app_routes.dart';
import 'package:flutter_bloc_concepts/utility/app_bloc_observer.dart';
import 'package:path_provider/path_provider.dart';
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
