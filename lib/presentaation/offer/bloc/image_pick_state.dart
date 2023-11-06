part of 'image_pick_bloc.dart';

@freezed
class ImagePickState with _$ImagePickState {
  const factory ImagePickState.initial() = _Initial;
  const factory ImagePickState.loadedImage({required XFile image,required String url}) = _loadedImage;
  
}
