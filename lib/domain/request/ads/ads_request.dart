import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'ads_request.g.dart';

@JsonSerializable()
class AdsRequest extends Params {
  const AdsRequest(
      {required this.title,
      required this.dateStart,
      required this.place,
      required this.duration,
      this.id,
      required this.description,
      required this.price,
      required this.images,
      required this.total});

  final String title;
  final String description;
  final double price;
  final double total;
  final int duration;
  final String place;
  final String dateStart;
  final String images;
  final int? id;

  Map<String, dynamic> toJson() => _$AdsRequestToJson(this);
  factory AdsRequest.fromJson(Map<String, dynamic> json) =>
      _$AdsRequestFromJson(json);

  @override
  // TODO: implement props
  List<Object?> get props => [];
}
