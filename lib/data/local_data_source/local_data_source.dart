import 'package:commmercial_directory_seller/core/paginated/ads_paginated/ads_paginated.dart';
import 'package:commmercial_directory_seller/core/paginated/offers_paginated/offer_paginated.dart';
import 'package:commmercial_directory_seller/domain/entities/ads_entity/ads_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/chat_entity/chat_response.dart';
import 'package:commmercial_directory_seller/domain/entities/company_entity/company_response.dart';
import 'package:commmercial_directory_seller/domain/entities/durations_entity/durations_response.dart';
import 'package:commmercial_directory_seller/domain/entities/information_subscribtion.dart';
import 'package:commmercial_directory_seller/domain/entities/offer_entity/offer_entity.dart';
import 'package:commmercial_directory_seller/domain/entities/places_entity/places_response.dart';
import 'package:commmercial_directory_seller/domain/entities/profile_entity/profile_response.dart';
import 'package:commmercial_directory_seller/domain/entities/standard_entity/standar_response.dart';
import 'package:commmercial_directory_seller/domain/entities/subscription_entity/subscription_response.dart';
import 'package:commmercial_directory_seller/domain/request/auth/register/register_part_two_seller.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'local_data_keys.dart';

abstract class LocalDataSource {
  T? getValue<T>(LocalDataKeys key, {dynamic defaultValue});
  Future<void> setValue<T>(LocalDataKeys key, T value);
  Future<void> clear();
}

class LocalDataSourceImpl implements LocalDataSource {
  LocalDataSourceImpl(Box<dynamic> box) : _box = box;

  final Box<dynamic> _box;

  static Future<Box<dynamic>> init() async {
    await Hive.initFlutter();
    Hive.registerAdapter(UserTypeAdapter());
    Hive.registerAdapter(ChatEntityAdapter());
    Hive.registerAdapter(ProfileEntityAdapter());
    Hive.registerAdapter(SubscriptionResponseAdapter());
    Hive.registerAdapter(SubscriptionEntityAdapter());
    Hive.registerAdapter(OfferEntityAdapter());
    Hive.registerAdapter(OfferDetailsRasponseAdapter());
    Hive.registerAdapter(OfferPaginatedAdapter());
    Hive.registerAdapter(DurationsEntityAdapter());
    Hive.registerAdapter(AdsEntityAdapter());
    Hive.registerAdapter(AdsPaginatedAdapter());
    // Hive.registerAdapter(MetaAdapter());
    Hive.registerAdapter(InformationEntityAdapter());
    Hive.registerAdapter(WorkDaysAdapter());
    Hive.registerAdapter(SocialAccountsAdapter());
    Hive.registerAdapter(CompanyEntityAdapter());
    Hive.registerAdapter(PlacesAdapter());
    Hive.registerAdapter(UpgradedAdapter());
    Hive.registerAdapter(StandarEntityAdapter());

    return Hive.openBox<dynamic>('defaultBox');
  }

  @override
  T? getValue<T>(LocalDataKeys key, {dynamic defaultValue}) {
    return _box.get(key.name, defaultValue: defaultValue) as T?;
  }

  @override
  Future<void> setValue<T>(LocalDataKeys key, T value) async {
    await _box.put(key.name, value);
  }

  @override
  Future<void> clear() async {
    await _box.clear();
  }
}

// Can be generated automatically
class UserTypeAdapter extends TypeAdapter<UserType> {
  @override
  final typeId = 0;

  @override
  UserType read(BinaryReader reader) {
    return UserType.values.byName(reader.read());
  }

  @override
  void write(BinaryWriter writer, UserType obj) {
    writer.write(obj.name);
  }
}

class InformationEntityAdapter extends TypeAdapter<InformationEntity> {
  @override
  final int typeId = 50;

  @override
  InformationEntity read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return InformationEntity(
      id: fields[0] as int?,
      name: fields[1] as String?,
      duration: fields[4] ,
      features: (fields[3] as List?)?.cast<String>(),
      price: fields[2] ,
      adsDiscount: fields[16],
      maxAdsPerNotification: fields[12],
      maxAdsViaSectorBanner: fields[15],
      maxFreeAds: fields[13],
      maxOfferChange: fields[7],
      offerAdditionCost: fields[6],
      maxOffers: fields[5],
      maxSpecialties: fields[9],
      offerChangeCost: fields[8],
      maxUsers: fields[14],
      notificationCost: fields[11],
      specialtyAdditionCost: fields[10],
    );
  }

  @override
  void write(BinaryWriter writer, InformationEntity obj) {
    writer
      ..writeByte(17)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.name)
      ..writeByte(2)
      ..write(obj.price)
      ..writeByte(3)
      ..write(obj.features)
      ..writeByte(4)
      ..write(obj.duration)
      ..writeByte(5)
      ..write(obj.maxOffers)
      ..writeByte(6)
      ..write(obj.offerAdditionCost)
      ..writeByte(7)
      ..write(obj.maxOfferChange)
      ..writeByte(8)
      ..write(obj.offerChangeCost)
      ..writeByte(9)
      ..write(obj.maxSpecialties)
      ..writeByte(10)
      ..write(obj.specialtyAdditionCost)
      ..writeByte(11)
      ..write(obj.notificationCost)
      ..writeByte(12)
      ..write(obj.maxAdsPerNotification)
      ..writeByte(13)
      ..write(obj.maxFreeAds)
      ..writeByte(14)
      ..write(obj.maxUsers)
      ..writeByte(15)
      ..write(obj.maxAdsViaSectorBanner)
      ..writeByte(16)
      ..write(obj.adsDiscount);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is InformationEntityAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
