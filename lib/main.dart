import 'package:blocpract/HomeView/bloc/home_bloc.dart';
import 'package:blocpract/HomeView/counterscreen.dart';
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
    return BlocProvider(
        create: (_) => HomeBloc(),
        child: const MaterialApp(
            debugShowCheckedModeBanner: false, home: CounterScreen()));
  }
}
