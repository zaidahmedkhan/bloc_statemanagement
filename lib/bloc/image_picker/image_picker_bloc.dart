import 'package:bloc_demo/bloc/image_picker/image_picker_event.dart';
import 'package:bloc_demo/bloc/image_picker/image_picker_state.dart';
import 'package:bloc_demo/utils/image_picker_utils.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ImagePickerBloc extends Bloc<ImagePickerEvent, ImagePickerState> {
  final ImagePickerUtils imagePickerUtils;
  ImagePickerBloc(this.imagePickerUtils) : super(const ImagePickerState()){
    on<CameraCapture>(cameraCapture);
  }

  void cameraCapture(CameraCapture event, Emitter<ImagePickerState> states){

  }
}
