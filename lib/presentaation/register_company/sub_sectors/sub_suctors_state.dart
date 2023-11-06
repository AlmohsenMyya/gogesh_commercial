part of '../sub_sectors/sub_suctors_bloc.dart';

@freezed
class SubSuctorsState with _$SubSuctorsState {
  const factory SubSuctorsState.dataLoaded({required List<StandarEntity> data,required Meta meta}) =
      _DataLoaded;
  const factory SubSuctorsState.initial() = _Initial;
  const factory SubSuctorsState.loading() = _Loading;
  const factory SubSuctorsState.error() = _Error;
  const factory SubSuctorsState.empty() = _Empty;
  const factory SubSuctorsState.networkError() = _NetworkError;
  const factory SubSuctorsState.loadingMore({required List<StandarEntity> data}) =
      _LoadingMore;
  const factory SubSuctorsState.itemChanged(
      {required StandarEntity item, required List<StandarEntity> data}) = _ItemChanged;}
