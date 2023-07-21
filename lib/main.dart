// import 'package:bloc_part_1/cubits/internet_cubit.dart';
// import 'package:bloc_part_1/screens/home_screen.dart';
import 'package:bloc_part_1/presentation/router/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

//import 'blocs/internet_bloc/internet_bloc.dart';
import 'logic/cubit/counter_cubit.dart';
// import 'presentation/screens/counter_screen.dart';
// import 'presentation/screens/second_screen.dart';
// import 'presentation/screens/third_screen.dart';
// import 'screens/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider<CounterCubit>(
//       create: (context) => CounterCubit(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: const CounterScreen(),
//         theme: ThemeData.light(useMaterial3: true),
//         darkTheme: ThemeData.dark(useMaterial3: true),
//       ),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: WelcomeScreen(),
//       theme: ThemeData.light(useMaterial3: true),
//       darkTheme: ThemeData.dark(useMaterial3: true),
//     );
//   }
// }

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => InternetCubit(),
//       child: MaterialApp(
//         debugShowCheckedModeBanner: false,
//         home: HomeScreen(),
//         theme: ThemeData.light(useMaterial3: true),
//         darkTheme: ThemeData.dark(useMaterial3: true),
//       ),
//     );
//   }
// }

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final CounterCubit _counterCubit = CounterCubit();
  final AppRouter _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return BlocProvider<CounterCubit>(
      create: (context) => CounterCubit(),
      child: MaterialApp(
        onGenerateRoute: (settings) => _appRouter.onGenerateRoute(settings),
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        darkTheme: ThemeData.dark(useMaterial3: true),
      ),
    );
  }

    // @override
    // void dispose() {
    //   _appRouter.dispose();
    //   super.dispose();
    // }
}
