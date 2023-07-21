import 'package:bloc_part_1/logic/cubit/counter_cubit.dart';
import 'package:bloc_part_1/screens/home_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../screens/counter_screen.dart';
import '../screens/second_screen.dart';
import '../screens/third_screen.dart';

class AppRouter {
  // final CounterCubit _counterCubit = CounterCubit();
  // Route onGenerateRoute(RouteSettings routeSettings) {
  //   switch (routeSettings.name) {
  //     case '/':
  //       return MaterialPageRoute(
  //           builder: (_) => BlocProvider.value(
  //                 value: _counterCubit,
  //                 child: const CounterScreen(
  //                   title: 'Home Screen',
  //                   color: Colors.blueAccent,
  //                 ),
  //               ));
  //     case '/second':
  //       return MaterialPageRoute(
  //           builder: (_) => BlocProvider.value(
  //                 value: _counterCubit,
  //                 child: const SecondScreen(
  //                   title: 'Second Screen',
  //                   color: Colors.redAccent,
  //                 ),
  //               ));
  //     case '/third':
  //       return MaterialPageRoute(
  //           builder: (_) => BlocProvider.value(
  //                 value: _counterCubit,
  //                 child: const ThirdScreen(
  //                   title: 'Third Screen',
  //                   color: Colors.greenAccent,
  //                 ),
  //               ));
  //     default:
  //       return MaterialPageRoute(builder: (_) => const HomeScreen());
  //   }
  // }

  Route onGenerateRoute(RouteSettings routeSettings) {
    switch (routeSettings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const CounterScreen(
            title: 'Home Screen',
            color: Colors.blueAccent,
          ),
        );
      case '/second':
        return MaterialPageRoute(
            builder: (_) => const SecondScreen(
              title: 'Second Screen',
              color: Colors.redAccent,
            ));
      case '/third':
        return MaterialPageRoute(
            builder: (_) => const ThirdScreen(
              title: 'Third Screen',
              color: Colors.greenAccent,
            ));
      default:
        return MaterialPageRoute(builder: (_) => const HomeScreen());
    }
  }

  // void dispose() {
  //   _counterCubit.close();
  // }
}
