import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:blocpract/util/image_picker_util.dart';
import 'package:equatable/equatable.dart';
import 'package:image_picker/image_picker.dart';
part 'image_picker_event.dart';
part 'image_picker_state.dart';


class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;

  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()) {
    on<CameraCaptureEvent>(cameraCaptureEvent);
    on<GalleryPickerEvent>(galleryPickerEvent);
  }

  FutureOr<void> cameraCaptureEvent(
      CameraCaptureEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.cameraCapture();
    emit(state.copyWith(file: file));
  }

  FutureOr<void> galleryPickerEvent(
      GalleryPickerEvent event, Emitter<ImagePickerState> emit) async {
    XFile? file = await imagePickerUtils.gallerySelection();
    emit(state.copyWith(file: file));
  }
}
