import 'package:json_annotation/json_annotation.dart';

part 'country.g.dart';

@JsonSerializable(nullable: false)
class Country {
  String name;
  String code;
  String slug;
  int newConfirmed;
  int totalConfirmed;
  int newDeaths;
  int totalDeaths;
  int newRecovered;
  int totalRecovered;
  @JsonKey(name: "Date")
  DateTime date;

  Country(
      {this.name,
      this.code,
      this.slug,
      this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered,
      this.date});

  factory Country.fromJson(Map<String, dynamic> json) =>
      _$CountryFromJson(json);

  Map<String, dynamic> toJson() => _$CountryToJson(this);

}
