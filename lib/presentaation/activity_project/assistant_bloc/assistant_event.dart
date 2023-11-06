part of '../assistant_bloc/assistant_bloc.dart';

@freezed
class AssistantEvent with _$AssistantEvent {
 const factory AssistantEvent.load() = _load;
 const factory AssistantEvent.addAssistant({required AddAssistantRequest request}) = _addAssistant;
  const factory AssistantEvent.uploadImage({required ImageSource source}) =
      _UploadImage;
 const factory AssistantEvent.deleteAssistant({required int id,required int index}) = _deleteAssistant;
 
}