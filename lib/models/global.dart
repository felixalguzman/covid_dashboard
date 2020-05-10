import 'package:json_annotation/json_annotation.dart';

part 'global.g.dart';

@JsonSerializable(explicitToJson: true)
class Global {
  @JsonKey(name: "NewConfirmed")
  int newConfirmed;
  @JsonKey(name: "TotalConfirmed")
  int totalConfirmed;
  @JsonKey(name: "NewDeaths")
  int newDeaths;
  @JsonKey(name: "TotalDeaths")
  int totalDeaths;
  @JsonKey(name: "NewRecovered")
  int newRecovered;
  @JsonKey(name: "TotalRecovered")
  int totalRecovered;

  Global(
      {this.newConfirmed,
      this.totalConfirmed,
      this.newDeaths,
      this.totalDeaths,
      this.newRecovered,
      this.totalRecovered});

  factory Global.fromJson(Map<String, dynamic> json) => _$GlobalFromJson(json);

  Map<String, dynamic> toJson() => _$GlobalToJson(this);
}
