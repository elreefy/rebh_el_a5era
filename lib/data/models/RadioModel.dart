class RadioModel {
  RadioModel({
      required this.name,
      required this.url,});

  RadioModel.fromJson(dynamic json) {
    name = json['Name'];
    url = json['URL'];
  }
  String? name;
  String? url;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['Name'] = name;
    map['URL'] = url;
    return map;
  }

}