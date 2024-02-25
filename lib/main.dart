import 'package:blocpract/HomeView/bloc/home_bloc.dart';
import 'package:blocpract/HomeView/counterscreen.dart';
import 'package:blocpract/switch_screen/bloc/switch_bloc.dart';
import 'package:blocpract/switch_screen/bloc/switch_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // return MaterialApp(
    //   home: SwitchScreen(),
    // );

    return BlocProvider(
        create: (_) => SwitchBloc(),
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: SwitchScreen()));
  }
}
