
import 'package:commmercial_directory_seller/core/paginated/meta.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'standar_paginated.freezed.dart';
part 'standar_paginated.g.dart';

@freezed
class StandarPaginated with _$StandarPaginated {
  factory StandarPaginated({required List<StandarEntity> data, required Meta? meta}) = _SectorsPaginated;
	
  factory StandarPaginated.fromJson(Map<String, dynamic> json) =>
			_$StandarPaginatedFromJson(json);
}
