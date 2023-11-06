// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'offer_paginated.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class OfferPaginatedAdapter extends TypeAdapter<OfferPaginated> {
  @override
  final int typeId = 35;

  @override
  OfferPaginated read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return OfferPaginated(
      data: (fields[0] as List).cast<OfferEntity>(),
      meta: fields[1] as Meta,
    );
  }

  @override
  void write(BinaryWriter writer, OfferPaginated obj) {
    writer
      ..writeByte(2)
      ..writeByte(0)
      ..write(obj.data)
      ..writeByte(1)
      ..write(obj.meta);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is OfferPaginatedAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OfferPaginated _$OfferPaginatedFromJson(Map<String, dynamic> json) =>
    OfferPaginated(
      data: (json['data'] as List<dynamic>)
          .map((e) => OfferEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      meta: Meta.fromJson(json['meta'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OfferPaginatedToJson(OfferPaginated instance) =>
    <String, dynamic>{
      'data': instance.data,
      'meta': instance.meta,
    };
