import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:commmercial_directory_seller/Utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:image_picker/image_picker.dart';

part 'image_pick_event.dart';
part 'image_pick_state.dart';
part 'image_pick_bloc.freezed.dart';

class ImagePickBloc extends Bloc<ImagePickEvent, ImagePickState> {
  ImagePickBloc() : super(_Initial()) {
    on<ImagePickEvent>(_mapEventToState);
  }
  FutureOr _mapEventToState(
      ImagePickEvent event, Emitter<ImagePickState> emit) {
    return event.map( 
     uploadImage: (value) async {
        final result = await pickImage(ImageSource.gallery);
        if (result!.path.isNotEmpty) {
          emit(ImagePickState.loadedImage(image: result,url: value.url));
        } else {
          emit(const ImagePickState.initial());
        }
      }
    );
  }
}
