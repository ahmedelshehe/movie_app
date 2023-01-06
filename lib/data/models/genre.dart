import 'dart:convert';
Genre genreFromJson(String str) => Genre.fromJson(json.decode(str));
String genreToJson(Genre data) => json.encode(data.toJson());
class Genre {
  Genre({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Genre.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;

  num get id => _id ??0;
  String get name => _name ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}