import 'package:commmercial_directory_seller/core/use_case/use_case.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_primary_seller.g.dart';

// Map<String, dynamic> serializeRegisterRequest(RegisterPrimarySeller object) =>
//     object.toJson();

@JsonSerializable()
class RegisterPrimarySeller extends Params {
  const RegisterPrimarySeller({
    this.email,
    this.password,
    this.sectionId,
    this.serviceId,
    this.passwordConfirmation,
    this.firstname,
    this.lastname,
    this.phone,
    this.gender,
    this.countryId,
    this.cityId,
    this.regionId,
    this.city,
    this.country,
    this.region,
    this.fcmToken,
    this.phoneCommercial,
    this.activityId,
    this.civilCard,
    this.lisence,
    this.sectorId,
    this.singnature,
    this.subSectors,
    this.description,
    this.type,
    this.nameCommercial,
  });

  final String? email;
  final String? password;
  final String? type;
  final String? passwordConfirmation;
  final String? description,nameCommercial;
  final String? firstname, lastname, phone, gender, phoneCommercial;
  final List<StandarEntity>? serviceId;
  final List<StandarEntity>? sectionId;
  final int? countryId, cityId, regionId;
  final int? sectorId, activityId, subSectors;
  final List<String>? civilCard;
  final String? lisence, singnature;
  final String? country;
  final String? city;
  final String? region;
  final String? fcmToken;

  factory RegisterPrimarySeller.fromJson(Map<String, dynamic> json) =>
      _$RegisterPrimarySellerFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterPrimarySellerToJson(this);

  @override
  List<Object?> get props => [sectionId, serviceId];
}
