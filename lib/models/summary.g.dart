// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'summary.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Summary _$SummaryFromJson(Map<String, dynamic> json) {
  return Summary(
    global: Global.fromJson(json['Global'] as Map<String, dynamic>),
    countries: (json['Countries'] as List)
        .map((e) => Country.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$SummaryToJson(Summary instance) => <String, dynamic>{
      'Global': instance.global.toJson(),
      'Countries': instance.countries.map((e) => e.toJson()).toList(),
    };
