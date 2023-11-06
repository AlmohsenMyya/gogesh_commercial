import 'package:commmercial_directory_seller/domain/entities/company_entity/company_response.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_part_two_seller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'work_days_response.freezed.dart';
part 'work_days_response.g.dart';

@freezed
class WorkDaysResponse with _$WorkDaysResponse {
  factory WorkDaysResponse({required WorkDaysEntity data}) = _WorkDaysResponse;

  factory WorkDaysResponse.fromJson(Map<String, dynamic> json) =>
      _$WorkDaysResponseFromJson(json);
}

@JsonSerializable()
class WorkDaysEntity {
  const WorkDaysEntity({
    required this.workDays,
    required this.id,
  });
  final int? id;
  @JsonKey(name: "work_days")
  final List<WorkDaysCompany>? workDays;

  factory WorkDaysEntity.fromJson(Map<String, dynamic> json) =>
      _$WorkDaysEntityFromJson(json);
  Map<String, dynamic> toJson() => _$WorkDaysEntityToJson(this);
}

@JsonSerializable()

class WorkDaysCompany {
  WorkDaysCompany({
    required this.day,
    required this.from,
    required this.to,
    required this.name,
    // required this.image,
  });
  String? from;
  String? to;
  String? name;
  String? day;

  factory WorkDaysCompany.fromJson(Map<String, dynamic> json) =>
      _$WorkDaysCompanyFromJson(json);
  Map<String, dynamic> toJson() => _$WorkDaysCompanyToJson(this);
}
