import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../logic/cubit/counter_cubit.dart';
import 'second_screen.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key, required this.title, required this.color})
      : super(key: key);

  final String title;
  final Color color;

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  //GlobalKey<ScaffoldState> homeScreenKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //key: homeScreenKey,
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text("Your current count"),
            const SizedBox(
              height: 20,
            ),
            BlocConsumer<CounterCubit, CounterState>(builder: (context, state) {
              return Text(state.counterValue.toString());
            }, listener: (context, state) {
              if (state.isIncremented == 1) {
                showSnackbar(context, "Incremented!");
              } else if (state.isIncremented == -1) {
                showSnackbar(context, "Decremented!");
              } else if (state.isIncremented == 0) {
                showSnackbar(context, "Cleared!");
              }
            }),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                  },
                  icon: const Icon(Icons.remove),
                ),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).increment();
                    },
                    icon: const Icon(Icons.add)),
                const SizedBox(
                  width: 20,
                ),
                IconButton(
                    onPressed: () {
                      BlocProvider.of<CounterCubit>(context).clear();
                    },
                    icon: const Icon(Icons.delete_outline))
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushNamed('/second');
              },
              child: Container(
                  height: 30,
                  width: 150,
                  color: widget.color,
                  child: const Center(child: Text("Go to Second Page"))),
            )
          ],
        ),
      ),
    );
  }

  ScaffoldFeatureController showSnackbar(BuildContext context, String message) {
    return ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text(message),
      duration: const Duration(milliseconds: 150),
    ));
  }
}
