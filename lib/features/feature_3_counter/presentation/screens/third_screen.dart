import 'package:flutter_bloc_concepts/utility/exports.dart';

class ThirddPage extends StatefulWidget {
  static const routeName = '/thridpageroute';

  const ThirddPage({Key? key}) : super(key: key);

  @override
  State<ThirddPage> createState() => _ThirddPageState();
}

class _ThirddPageState extends State<ThirddPage> {
  @override
  void dispose() {
    print("++++++++++++++++++++++++++++++++++++++++++++++");
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Thrid Page"),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Counter Value",
              style: TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            BlocBuilder<CounterCubit, CounterState>(
              builder: (context, state) {
                return Text(
                  state.counterValue.toString(),
                  style: const TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                  ),
                );
              },
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  tooltip: "Decrement",
                  child: const Icon(Icons.remove),
                  heroTag: null,
                ),
                const SizedBox(
                  width: 10,
                ),
                FloatingActionButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).increment();
                  },
                  tooltip: "Increment",
                  child: const Icon(Icons.add),
                  heroTag: null,
                ),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text("home page"),
              style: TextButton.styleFrom(
                  primary: Colors.black, backgroundColor: Colors.green),
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: () {
                Navigator.pushNamed(context, SecondPage.routeName);
              },
              child: const Text("Second page"),
              style: TextButton.styleFrom(
                  primary: Colors.black, backgroundColor: Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}
