import 'dart:io';

import 'package:blocpract/Image_picker/bloc/image_picker_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({super.key});

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text('Image picker with bloc'),
      ),
      body: BlocBuilder<ImagePickerBloc, ImagePickerState>(
        builder: (context, state) {
          if (state.file == null) {
            return InkWell(
                onTap: () {
                  context.read<ImagePickerBloc>().add(CameraCaptureEvent());
                },
                child: const Center(
                     child: CircleAvatar(child: Icon(Icons.camera))));
          } else {
            return Image.file(File(state.file!.path.toString()));
          }
        },
      ),
    );
  }
}
