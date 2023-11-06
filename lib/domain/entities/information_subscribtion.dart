import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'information_subscribtion.g.dart';

@JsonSerializable()
class InformationResponse {
  const InformationResponse({
    required this.information,
  });
  @JsonKey(name: "data")
  final InformationEntity information;
  factory InformationResponse.fromJson(Map<String, dynamic> json) =>
      _$InformationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$InformationResponseToJson(this);
}

class InformationEntity {
  int? id;
  String? name;
  int? maxOffers;
  int? offerAdditionCost;
  int? maxOfferChange;
  int? offerChangeCost;
  int? maxSpecialties;
  int? specialtyAdditionCost;
  int? notificationCost;
  int? maxAdsPerNotification;
  int? maxFreeAds;
  List<String>? features;
  int? duration;
  int? price;
  int? maxUsers;
  int? maxAdsViaSectorBanner;
  int? adsDiscount;

  InformationEntity(
      {this.id,
      this.name,
      this.maxOffers,
      this.offerAdditionCost,
      this.maxOfferChange,
      this.offerChangeCost,
      this.maxSpecialties,
      this.specialtyAdditionCost,
      this.notificationCost,
      this.maxAdsPerNotification,
      this.maxFreeAds,
      this.features,
      this.duration,
      this.price,
      this.maxUsers,
      this.maxAdsViaSectorBanner,
      this.adsDiscount});

  InformationEntity.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    maxOffers = json['max_offers'];
    offerAdditionCost = json['offer_addition_cost'];
    maxOfferChange = json['max_offer_change'];
    offerChangeCost = json['offer_change_cost'];
    maxSpecialties = json['max_specialties'];
    specialtyAdditionCost = json['specialty_addition_cost'];
    notificationCost = json['notification_cost'];
    maxAdsPerNotification = json['max_ads_per_notification'];
    maxFreeAds = json['max_free_ads'];
    features = json['features'].cast<String>();
    duration = json['duration'];
    price = json['price'];
    maxUsers = json['max_users'];
    maxAdsViaSectorBanner = json['max_ads_via_sector_banner'];
    adsDiscount = json['ads_discount'];
  }

  copyWith({
    int? id,
    String? name,
    int? maxOffers,
    int? offerAdditionCost,
    int? maxOfferChange,
    int? offerChangeCost,
    int? maxSpecialties,
    int? specialtyAdditionCost,
    int? notificationCost,
    int? maxAdsPerNotification,
    int? maxFreeAds,
    List<String>? features,
    int? duration,
    int? price,
    int? maxUsers,
    int? maxAdsViaSectorBanner,
    int? adsDiscount,
  }) {
    return InformationEntity(
      id: id ?? this.id,
      name: name ?? this.name,
      maxOffers: maxOffers ?? this.maxOffers,
      offerAdditionCost: offerAdditionCost ?? this.offerAdditionCost,
      maxOfferChange: maxOfferChange ?? this.maxOfferChange,
      offerChangeCost: offerChangeCost ?? this.offerChangeCost,
      maxSpecialties: maxSpecialties ?? this.maxSpecialties,
      specialtyAdditionCost:
          specialtyAdditionCost ?? this.specialtyAdditionCost,
      notificationCost: notificationCost ?? this.notificationCost,
      maxAdsPerNotification:
          maxAdsPerNotification ?? this.maxAdsPerNotification,
      maxFreeAds: maxFreeAds ?? this.maxFreeAds,
      features: features ?? this.features,
      duration: duration ?? this.duration,
      price: price ?? this.price,
      maxUsers: maxUsers ?? this.maxUsers,
      maxAdsViaSectorBanner:
          maxAdsViaSectorBanner ?? this.maxAdsViaSectorBanner,
      adsDiscount: adsDiscount ?? this.adsDiscount,
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['max_offers'] = this.maxOffers;
    data['offer_addition_cost'] = this.offerAdditionCost;
    data['max_offer_change'] = this.maxOfferChange;
    data['offer_change_cost'] = this.offerChangeCost;
    data['max_specialties'] = this.maxSpecialties;
    data['specialty_addition_cost'] = this.specialtyAdditionCost;
    data['notification_cost'] = this.notificationCost;
    data['max_ads_per_notification'] = this.maxAdsPerNotification;
    data['max_free_ads'] = this.maxFreeAds;
    data['features'] = this.features;
    data['duration'] = this.duration;
    data['price'] = this.price;
    data['max_users'] = this.maxUsers;
    data['max_ads_via_sector_banner'] = this.maxAdsViaSectorBanner;
    data['ads_discount'] = this.adsDiscount;
    return data;
  }
}

// @JsonSerializable()
// @HiveType(typeId: 50)
// class InformationEntity {
//   InformationEntity({
//     required this.id,
//     required this.name,
//     required this.duration,
//     required this.features,
//     required this.price,
//     required this.adsDiscount,
//     required this.maxAdsPerNotification,
//     required this.maxAdsViaSectorBanner,
//     required this.maxFreeAds,
//     required this.maxOfferChange,
//     required this.offerAdditionCost,
//     required this.maxOffers,
//     required this.maxSpecialties,
//     required this.offerChangeCost,
//     required this.maxUsers,
//     required this.notificationCost,
//     required this.specialtyAdditionCost,
//   });
//   @HiveField(0)
//   final int? id;
//   @HiveField(1)
//   final String? name;
//   @HiveField(2)
//   final int? price;
//   @HiveField(3)
//   final List<String>? features;
//   @HiveField(4)
//   final int? duration;
//   @HiveField(5)
//   int? maxOffers;
//   @HiveField(6)
//   int? offerAdditionCost;
//   @HiveField(7)
//   int? maxOfferChange;
//   @HiveField(8)
//   int? offerChangeCost;
//   @HiveField(9)
//   int? maxSpecialties;
//   @HiveField(10)
//   int? specialtyAdditionCost;
//   @HiveField(11)
//   int? notificationCost;
//   @HiveField(12)
//   int? maxAdsPerNotification;
//   @HiveField(13)
//   int? maxFreeAds;
//   @HiveField(14)
//   int? maxUsers;
//   @HiveField(15)
//   int? maxAdsViaSectorBanner;
//   @HiveField(16)
//   int? adsDiscount;

//   factory InformationEntity.fromJson(Map<String, dynamic> json) =>
//       _$InformationEntityFromJson(json);
//   Map<String, dynamic> toJson() => _$InformationEntityToJson(this);
// }
