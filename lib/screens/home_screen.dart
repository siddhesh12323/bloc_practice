import 'package:bloc_part_1/cubits/internet_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import '../blocs/internet_bloc/internet_bloc.dart';
//import '../blocs/internet_bloc/internet_state.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Center(
        child: BlocConsumer<InternetCubit, InternetState>(
          listener: (context, state) {
            if (state == InternetState.Gained) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Internet connection enabled!")));
            } else if (state == InternetState.Lost) {
              ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(content: Text("Internet connection lost!")));
            }
          },
          builder: (context, state) {
            if (state == InternetState.Gained) {
              return const Text("Connected to the internet!");
            } else if (state == InternetState.Lost) {
              return const Text("Connection Lost!");
            } else {
              return const Text("Loading...");
            }
          },
        ),
        // child: BlocBuilder<InternetBloc, InternetState>(
        //   builder: (context, state) {
        //     if (state is InternetGainedState) {
        //       return Text("Connected to the internet!");
        //     } else if (state is InternetLostState) {
        //       return Text("Connection Lost!");
        //     } else {
        //       return Text("Loading...");
        //     }
        //   },
        // ),
      )),
    );
  }
}
