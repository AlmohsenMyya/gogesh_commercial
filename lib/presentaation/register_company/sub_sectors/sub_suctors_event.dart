part of '../sub_sectors/sub_suctors_bloc.dart';

@freezed
class SubSuctorsEvent with _$SubSuctorsEvent {
    const factory SubSuctorsEvent.load({required Filter filter}) = _Load;
  const factory SubSuctorsEvent.loadMore() = _LoadMore;
  const factory SubSuctorsEvent.refresh() = _Refresh;
  const factory SubSuctorsEvent.changeItem({required StandarEntity item}) = _ChangeItem;
}