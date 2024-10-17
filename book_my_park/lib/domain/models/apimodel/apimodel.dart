import 'package:json_annotation/json_annotation.dart';

part 'apimodel.g.dart';

@JsonSerializable()
class Apimodel {
  @JsonKey(name: 'name')
  String? name;
  @JsonKey(name: 'location')
  String? location;
  @JsonKey(name: 'lat')
  double? latitude;
  @JsonKey(name: 'lon')
  double? longitude;
  @JsonKey(name: 'price')
  int? price;
  @JsonKey(name: 'availability')
  bool? availability;
  @JsonKey(name: 'image')
  String? image;
  @JsonKey(name: 'tslot')
  int? tslot;
  @JsonKey(name: 'aslot')
  int? aslot;

  Apimodel(
      {this.name,
      this.price,
      this.availability,
      this.image,
      this.aslot,
      this.tslot,
      this.latitude,
      this.location,
      this.longitude});

  factory Apimodel.fromJson(Map<String, dynamic> json) {
    return _$ApimodelFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ApimodelToJson(this);
}
