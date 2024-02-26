import 'package:blocpract/Image_picker/bloc/image_picker_bloc.dart';
import 'package:blocpract/UI/image_picker_screen.dart';
import 'package:blocpract/counter/bloc/home_bloc.dart';
import 'package:blocpract/switch_toggle/bloc/switch_bloc.dart';
import 'package:blocpract/util/image_picker_util.dart';
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
    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => HomeBloc(),
          ),
          BlocProvider(
            create: (context) => SwitchBloc(),
          ),
          BlocProvider(
            create: (context) => ImagePickerBloc(ImagePickerUtils()),
          )
        ],
        child: const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: ImagePickerScreen(),
        ));
  }
}
