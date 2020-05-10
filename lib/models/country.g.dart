// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Country _$CountryFromJson(Map<String, dynamic> json) {
  return Country(
    name: json['name'] as String,
    code: json['code'] as String,
    slug: json['slug'] as String,
    newConfirmed: json['newConfirmed'] as int,
    totalConfirmed: json['totalConfirmed'] as int,
    newDeaths: json['newDeaths'] as int,
    totalDeaths: json['totalDeaths'] as int,
    newRecovered: json['newRecovered'] as int,
    totalRecovered: json['totalRecovered'] as int,
    date: DateTime.parse(json['Date'] as String),
  );
}

Map<String, dynamic> _$CountryToJson(Country instance) => <String, dynamic>{
      'name': instance.name,
      'code': instance.code,
      'slug': instance.slug,
      'newConfirmed': instance.newConfirmed,
      'totalConfirmed': instance.totalConfirmed,
      'newDeaths': instance.newDeaths,
      'totalDeaths': instance.totalDeaths,
      'newRecovered': instance.newRecovered,
      'totalRecovered': instance.totalRecovered,
      'Date': instance.date.toIso8601String(),
    };
