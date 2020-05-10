import 'package:covid_dashboard/models/country.dart';
import 'package:json_annotation/json_annotation.dart';

import 'global.dart';

part 'summary.g.dart';

@JsonSerializable(nullable: false, explicitToJson: true)
class Summary {
  @JsonKey(name: "Global")
  Global global;
  @JsonKey(name: "Countries")
  List<Country> countries = [];

  Summary({this.global, this.countries});

  factory Summary.fromJson(Map<String, dynamic> json) =>
      _$SummaryFromJson(json);

  Map<String, dynamic> toJson() => _$SummaryToJson(this);
}
