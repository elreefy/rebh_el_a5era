//AzkarModel using json_serializable conatin list of objects each object conatin 5 properties category, count, description, reference, zekr
import 'package:json_annotation/json_annotation.dart';
part 'Azkar_model.g.dart';
@JsonSerializable()
class AzkarModel {
  String? category;
  String? count;
  String? description;
  String? reference;
  String? zekr;

  AzkarModel({this.category, this.count, this.description, this.reference, this.zekr});

  factory AzkarModel.fromJson(Map<String, dynamic> json) =>
      _$AzkarModelFromJson(json);

  Map<String, dynamic> toJson() => _$AzkarModelToJson(this);
}