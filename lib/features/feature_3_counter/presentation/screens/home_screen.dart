import 'package:flutter_bloc_concepts/features/feature_2_conectivity/presentation/screens/internet_connection_screen.dart';
import 'package:flutter_bloc_concepts/utility/exports.dart';

class MyHomePage extends StatefulWidget {
  static const routeName = '/homeroute';

  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final abc = "sdsdv";
  Connectivity connectivity = Connectivity();
  final InternetCubit internetCubit =
      InternetCubit(connectivity: Connectivity());
  late StreamSubscription connectivityStreamSubscription;

  @override
  void initState() {
    checkkk();

    super.initState();
  }

  void checkkk() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      showMaterialDialog();
    }
  }

  @override
  void dispose() {
    connectivityStreamSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    //! get current Route
    // String name = ModalRoute.of(context)?.settings.name as String;
    //!-------------------

    return MultiBlocListener(
      listeners: [
        BlocListener<CounterCubit, CounterState>(
          listener: (context, state) {
            listnerFunction(context: context, state: state);
          },
        ),
        BlocListener<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state is InternetDisconnected) {
              showModel(context);
            }
          },
        )

        // BlocListener<InternetCubit, InternetState>(
        //   listener: (context, state) {
        //     if (state is InternetConnectedWiFi) {
        //       context.read<CounterCubit>().increment();
        //     } else if (state is InternetConnectedMobile) {
        //       context.read<CounterCubit>().decrement();
        //     }
        //   },
        // ),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Home Page"),
          actions: [
            IconButton(
                onPressed: () {
                  Navigator.pushNamed(context, SettingsScreen.routeName);
                },
                icon: const Icon(
                  Icons.settings,
                ))
          ],
        ),
        body: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            padding: const EdgeInsets.all(10),
            children: [
              // BlocBuilder<InternetCubit, InternetState>(
              //   builder: (context, state) {
              //     if (state is InternetConnected &&
              //         state.connectionType == ConnectionType.wifi) {
              //       return const Text("WIFI");
              //     } else if (state is InternetConnected &&
              //         state.connectionType == ConnectionType.mobile) {
              //       return const Text("Mobile");
              //     } else if (state is InternetDisconnected) {
              //       return const Text("Disconnected");
              //     }
              //     return const CircularProgressIndicator();
              //   },
              // ),
              // BlocBuilder<CounterCubit, CounterState>(
              //   builder: (context, state) {
              //     return Text(
              //       state.counterValue.toString(),
              //       style: const TextStyle(
              //         fontSize: 50,
              //         fontWeight: FontWeight.bold,
              //       ),
              //     );
              //   },
              // ),
              // const SizedBox(
              //   height: 30,
              // ),
              Text("Route Name: ${ModalRoute.of(context)?.settings.name}"),
              const SizedBox(
                height: 30,
              ),

              //!Nested blocBulder It is generally better to use BlocProvider and avoid manually managing the cubits yourself.
              BlocBuilder<InternetCubit, InternetState>(
                builder: (context, connectionState) =>
                    BlocBuilder<CounterCubit, CounterState>(
                  builder: (context, counterState) {
                    if (connectionState is InternetConnected &&
                        connectionState.connectionType ==
                            ConnectionType.mobile) {
                      return CounterAndNetLabel(
                        counterState: counterState,
                        internetType: 'Mobile',
                      );
                    } else if (connectionState is InternetConnected &&
                        connectionState.connectionType == ConnectionType.wifi) {
                      return CounterAndNetLabel(
                        counterState: counterState,
                        internetType: 'WiFi',
                      );
                    } else {
                      return CounterAndNetLabel(
                        counterState: counterState,
                        internetType: 'Disconnected',
                      );
                    }
                  },
                ),
              ),

              //!If you used BlocProvider to create the cubit you do not need to explicitly close the cubits (it is automatically handled by BlocProvider). If you manually create the cubit instances then you can override the dispose method in your State class and call close on each cubit explicitly. It is generally better to use BlocProvider and avoid manually managing the cubits yourself.
              //!---------------------------
              // Builder(builder: (context) {
              //   //after bloc version 8
              //   final counterState = context.watch<CounterCubit>().state;
              //   final intenetState = context.watch<InternetCubit>().state;
              //   if (intenetState is InternetConnected &&
              //       intenetState.connectionType == ConnectionType.mobile) {
              //     return CounterAndNetLabel(
              //       counterState: counterState,
              //       internetType: 'Mobile',
              //     );
              //   } else if (intenetState is InternetConnected &&
              //       intenetState.connectionType == ConnectionType.wifi) {
              //     return CounterAndNetLabel(
              //       counterState: counterState,
              //       internetType: 'WiFi',
              //     );
              //   } else {
              //     return CounterAndNetLabel(
              //       counterState: counterState,
              //       internetType: 'Disconnected',
              //     );
              //   }
              // }),
              //!-------------------------
              const SizedBox(
                height: 30,
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FloatingActionButton(
                    heroTag: "decrement",
                    tooltip: "Decrement",
                    child: const Icon(Icons.remove),
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).decrement();
                    },
                  ),
                  FloatingActionButton(
                    heroTag: "increment",
                    tooltip: "Increment",
                    child: const Icon(Icons.add),
                    onPressed: () {
                      // BlocProvider.of<CounterCubit>(context).increment();
                      context.read<CounterCubit>().increment();
                    },
                  ),
                ],
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, SecondPage.routeName);
                },
                child: const Text("second page"),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.green,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(context, ThirddPage.routeName);
                },
                child: const Text("Thrid page"),
                style: TextButton.styleFrom(
                  primary: Colors.black,
                  backgroundColor: Colors.green,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextButton(
                onPressed: () {
                  Navigator.pushNamed(
                      context, InternetConnectionTestScreen.routeName);
                },
                child: const Text("Internet Connection Page"),
                style: TextButton.styleFrom(
                    primary: Colors.white, backgroundColor: Colors.black87),
              ),
              const SizedBox(
                height: 30,
              ),
              Flex(
                direction: Axis.vertical,
                children: const [
                  Text("hello"),
                  Text("hello"),
                  Text("hello"),
                  Text("hello"),
                  Text("hello"),
                  Text("hello"),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<void> showModel(BuildContext context) {
    return showModalBottomSheet<void>(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 200,
          color: Colors.amber,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                const Text('Modal BottomSheet'),
                ElevatedButton(
                  child: const Text('Close BottomSheet'),
                  onPressed: () => Navigator.pop(context),
                )
              ],
            ),
          ),
        );
      },
    );
  }

  void showMaterialDialog() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: const Text('Material Dialog'),
            content: const Text('Hey! I am Coflutter!'),
            actions: <Widget>[
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close')),
              TextButton(
                onPressed: () {
                  print('HelloWorld!');
                  Navigator.pop(context);
                },
                child: const Text('HelloWorld!'),
              )
            ],
          );
        });
  }

  void listnerFunction(
      {required CounterState state, required BuildContext context}) {
    if (state.wasIncremented == true) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Incremented"),
          duration: Duration(milliseconds: 300),
        ),
      );
    } else if (state.wasIncremented == false) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Decremet"),
          duration: Duration(milliseconds: 300),
        ),
      );
    }
  }
}

class CounterAndNetLabel extends StatelessWidget {
  const CounterAndNetLabel({
    Key? key,
    required this.counterState,
    required this.internetType,
  }) : super(key: key);

  final CounterState counterState;
  final String internetType;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Counter:" + counterState.counterValue.toString(),
          style: textStyle(),
        ),
        Text(
          "Internet:" + internetType,
          style: textStyle(),
        ),
      ],
    );
  }

  TextStyle textStyle() => const TextStyle(color: Colors.black, fontSize: 30.0);
}
