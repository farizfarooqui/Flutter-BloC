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
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                        onTap: () {
                          context
                              .read<ImagePickerBloc>()
                              .add(CameraCaptureEvent());
                        },
                        child: const Center(
                            child: CircleAvatar(
                                child: Icon(
                          Icons.camera,
                          size: 50,
                        )))),
                    InkWell(
                        onTap: () {
                          context
                              .read<ImagePickerBloc>()
                              .add(GalleryPickerEvent());
                        },
                        child: const Center(
                            child: CircleAvatar(
                                child: Icon(Icons.image_outlined, size: 50)))),
                  ],
                ),
              ],
            );
          } else {
            return Image.file(File(state.file!.path.toString()));
          }
        },
      ),
    );
  }
}
