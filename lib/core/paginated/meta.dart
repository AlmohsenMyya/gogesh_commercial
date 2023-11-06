import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta.freezed.dart';
part 'meta.g.dart';

@freezed
class Meta with _$Meta {
  const factory Meta(
      {final int? total,
      @JsonKey(name: "current_page") @Default(1) final int? currentPage,
      @JsonKey(name: "next_page") @Default(2) final int? nextPage,
      @JsonKey(name: "per_page") @Default(16) final int? perPage,
      @JsonKey(name: "last_page") @Default(2) final int? lastPage}) = _Meta;
  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);
}
