import 'package:bloc_demo/bloc/counter/counter_bloc.dart';
import 'package:bloc_demo/bloc/image_picker/image_picker_bloc.dart';
import 'package:bloc_demo/bloc/switch/switch_bloc.dart';
import 'package:bloc_demo/bloc/todo/todo_bloc.dart';
import 'package:bloc_demo/ui/image_picker/image_picker_screen.dart';
import 'package:bloc_demo/ui/switch_example/switch_example_screen.dart';
import 'package:bloc_demo/ui/todo/todo_screen.dart';
import 'package:bloc_demo/utils/image_picker_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // @override
  // Widget build(BuildContext context) {
  //   // return BlocProvider(
  //   //   create: (_) => CounterBloc(),
  //   //   child: const MaterialApp(
  //   //     debugShowCheckedModeBanner: false,
  //   //     home: CounterScreen(),
  //   //   ),
  //   // );
  //   return BlocProvider(
  //     create: (_) => SwitchBloc(),
  //     child: BlocProvider(
  //       create: (context) => SwitchBloc(),
  //       child: const MaterialApp(
  //         debugShowCheckedModeBanner: false,
  //         home: SwitchExampleScreen(),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => CounterBloc()),
        BlocProvider(create: (_) => SwitchBloc()),
        BlocProvider(create: (_) => ImagePickerBloc(ImagePickerUtils())),
        BlocProvider(create: (_) => TodoBloc()),

      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        // home: SwitchExampleScreen(),
        // home: ImagePickerScreen(),
        home: TodoScreen(),
      ),
    );
  }
}
