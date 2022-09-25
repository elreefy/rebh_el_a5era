import 'package:json_annotation/json_annotation.dart';
part 'quraan_model.g.dart';

@JsonSerializable()
class QuraanModel {
  QuraanModel({
    this.code,
    this.status,
    this.data,
  });

  factory QuraanModel.fromJson(Map<String, dynamic> json) =>
      _$QuraanModelFromJson(json);
  Map<String, dynamic> toJson() => _$QuraanModelToJson(this);

  num? code;
  String? status;
  Data? data;
}

@JsonSerializable()
class Data {
  Data({
    this.number,
    this.name,
    this.englishName,
    this.englishNameTranslation,
    this.revelationType,
    this.numberOfAyahs,
    this.ayahs,
  });

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
  Map<String, dynamic> toJson() => _$DataToJson(this);

  num? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  String? revelationType;
  num? numberOfAyahs;
  List<Ayah>? ayahs;
}

@JsonSerializable()
class Ayah {
  Ayah({
    this.number,
    this.text,
    this.numberInSurah,
    this.juz,
  });

  factory Ayah.fromJson(Map<String, dynamic> json) => _$AyahFromJson(json);

  Map<String, dynamic> toJson() => _$AyahToJson(this);
  num? number;
  String? text;
  num? numberInSurah;
  num? juz;
}

