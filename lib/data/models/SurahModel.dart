class SurahModel {
  SurahModel({
      this.code, 
      this.status, 
      this.data,});

  SurahModel.fromJson(dynamic json) {
    code = json['code'];
    status = json['status'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(Data.fromJson(v));
      });
    }
  }
  num? code;
  String? status;
  List<Data>? data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['code'] = code;
    map['status'] = status;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    return map;
  }

}

class Data {
  Data({
      this.number, 
      this.name, 
      this.englishName, 
      this.englishNameTranslation, 
      this.numberOfAyahs, 
      this.revelationType,});

  Data.fromJson(dynamic json) {
    number = json['number'];
    name = json['name'];
    englishName = json['englishName'];
    englishNameTranslation = json['englishNameTranslation'];
    numberOfAyahs = json['numberOfAyahs'];
    revelationType = json['revelationType'];
  }
  num? number;
  String? name;
  String? englishName;
  String? englishNameTranslation;
  num? numberOfAyahs;
  String? revelationType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['number'] = number;
    map['name'] = name;
    map['englishName'] = englishName;
    map['englishNameTranslation'] = englishNameTranslation;
    map['numberOfAyahs'] = numberOfAyahs;
    map['revelationType'] = revelationType;
    return map;
  }

}