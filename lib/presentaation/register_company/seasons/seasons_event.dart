part of 'seasons_bloc.dart';

@freezed
class SeasonsEvent with _$SeasonsEvent {
  const factory SeasonsEvent.loadMore({required Filter filter}) = _loadMore;

  const factory SeasonsEvent.loadSeasons({required Filter filter}) =
      _loadSeasons;

  const factory SeasonsEvent.changedItem({
    required List<StandarEntity> data,
    pageKey,
    required bool lastPage,
    required List<StandarEntity> itemsSelected,
  }) = _changedItem;

  const factory SeasonsEvent.changeItem({required List<StandarEntity> items}) =
      _ChangeItem;
}
