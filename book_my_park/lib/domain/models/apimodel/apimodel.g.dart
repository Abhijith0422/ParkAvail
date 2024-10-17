// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apimodel.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Apimodel _$ApimodelFromJson(Map<String, dynamic> json) => Apimodel(
      name: json['name'] as String?,
      price: (json['price'] as num?)?.toInt(),
      availability: json['availability'] as bool?,
      image: json['image'] as String?,
      aslot: (json['aslot'] as num?)?.toInt(),
      tslot: (json['tslot'] as num?)?.toInt(),
      latitude: (json['lat'] as num?)?.toDouble(),
      location: json['location'] as String?,
      longitude: (json['lon'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ApimodelToJson(Apimodel instance) => <String, dynamic>{
      'name': instance.name,
      'location': instance.location,
      'lat': instance.latitude,
      'lon': instance.longitude,
      'price': instance.price,
      'availability': instance.availability,
      'image': instance.image,
      'tslot': instance.tslot,
      'aslot': instance.aslot,
    };
