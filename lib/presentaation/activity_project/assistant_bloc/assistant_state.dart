part of 'assistant_bloc.dart';

@freezed
class AssistantState with _$AssistantState {
  const factory AssistantState.initial() = _Initial;
  const factory AssistantState.dataLoaded({required List<ProfileEntity> data}) =
      _dataLoaded;

  const factory AssistantState.loadingDelete({required int indx}) =
      _loadingDelete;
  const factory AssistantState.successDelete() = _successDelete;

  const factory AssistantState.loading() = _loading;
  const factory AssistantState.loadingAdd() = _loadingAdd;
  const factory AssistantState.succes() = _succes;
  const factory AssistantState.error({String? error}) = _error;

  const factory AssistantState.imagePicked({required XFile image}) =
      _ImagePicked;
}
