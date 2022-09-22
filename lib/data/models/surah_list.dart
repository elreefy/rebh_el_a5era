//SurahModel using json_serializable conatin list of data objects each object conatin 5 number, name, englishName, numberOfAyahs,revelationType,

import 'package:json_annotation/json_annotation.dart';
part 'surah_list.g.dart';

@JsonSerializable()
class SurahList {
  final int code;
  final String status;
  final Data data;

  const SurahList({
    required this.code,
    required this.status,
    required this.data,
  });

  @override
  List<Object> get props {
    return [
      code,
      status,
      data,
    ];
  }

  @override
  String toString() {
    return 'SurahList(code: $code, status: $status, data: $data)';
  }

  factory SurahList.fromJson(Map<String, dynamic> json) =>
      _$SurahListFromJson(json);

  Map<String, dynamic> toMap() => _$SurahListToJson(this);
}

@JsonSerializable()
class Data {
  final List<Surah> surahs;

  const Data({
    required this.surahs,
  });

  @override
  List<Object> get props {
    return [
      surahs,
    ];
  }

  @override
  String toString() {
    return 'Data(surahs: $surahs)';
  }

  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);

  Map<String, dynamic> toMap() => _$DataToJson(this);
}

@JsonSerializable()
class Surah {
  final int number;
  final String name;
  final String englishName;
  final int numberOfAyahs;
  final String revelationType;

  const Surah({
    required this.number,
    required this.name,
    required this.englishName,
    required this.numberOfAyahs,
    required this.revelationType,
  });

  @override
  List<Object> get props {
    return [
      number,
      name,
      englishName,
      numberOfAyahs,
      revelationType,
    ];
  }

  @override
  String toString() {
    return 'Surah(number: $number, name: $name, englishName: $englishName, numberOfAyahs: $numberOfAyahs, revelationType: $revelationType)';
  }

  factory Surah.fromJson(Map<String, dynamic> json) => _$SurahFromJson(json);

  Map<String, dynamic> toMap() => _$SurahToJson(this);
}
//
//
