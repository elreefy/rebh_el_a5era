// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Azkar_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AzkarModel _$AzkarModelFromJson(Map<String, dynamic> json) => AzkarModel(
      category: json['category'] as String?,
      count: json['count'] as String?,
      description: json['description'] as String?,
      reference: json['reference'] as String?,
      zekr: json['zekr'] as String?,
    );

Map<String, dynamic> _$AzkarModelToJson(AzkarModel instance) =>
    <String, dynamic>{
      'category': instance.category,
      'count': instance.count,
      'description': instance.description,
      'reference': instance.reference,
      'zekr': instance.zekr,
    };
