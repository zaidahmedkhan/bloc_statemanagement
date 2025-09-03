import 'package:bloc_demo/bloc/switch/switch_bloc.dart';
import 'package:bloc_demo/ui/switch_example/switch_example_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (_) => CounterBloc(),
    //   child: const MaterialApp(
    //     debugShowCheckedModeBanner: false,
    //     home: CounterScreen(),
    //   ),
    // );
    return BlocProvider(
      create: (_) => SwitchBloc(),
      child: BlocProvider(
        create: (context) => SwitchBloc(),
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: SwitchExampleScreen(),
        ),
      ),
    );
  }
}
