
import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_part_two_seller.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'edit_work_days_request.g.dart';


@JsonSerializable()
class EditWorkDaysRequest extends Params {
  const EditWorkDaysRequest({
    required this.workDays,
  });

  @JsonKey(name: "work_days")
  final List<WorkDays> workDays;

  factory EditWorkDaysRequest.fromJson(Map<String, dynamic> json) =>
      _$EditWorkDaysRequestFromJson(json);
  Map<String, dynamic> toJson() => _$EditWorkDaysRequestToJson(this);

  @override
  // TODO: implement props
  List<Object?> get props => [workDays];
}
