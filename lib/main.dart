import 'package:flutter_bloc_concepts/utility/exports.dart';

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

  HydratedBlocOverrides.runZoned(() => runApp(MyApp()),
      storage: storage, blocObserver: observer);
}

class MyApp extends StatelessWidget {
  final AppRoutes _appRoutes = AppRoutes();
  final Connectivity _connectivity = Connectivity();

  MyApp({Key? key}) : super(key: key);

  // MyApp({
  //   Key? key,
  //   // required this.appRoutes,
  //   required this.connectivity,
  // }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<InternetCubit>(
          create: (context) => InternetCubit(connectivity: _connectivity),
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
        onGenerateRoute: _appRoutes.onGenerateRoute,
      ),
    );
  }
}
