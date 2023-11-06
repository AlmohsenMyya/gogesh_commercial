part of 'image_pick_bloc.dart';

@freezed
class ImagePickEvent with _$ImagePickEvent {
  const factory ImagePickEvent.uploadImage({required String url})= _uploadImage;
}