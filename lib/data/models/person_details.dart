import 'dart:convert';
PersonDetails personDetailsFromJson(String str) => PersonDetails.fromJson(json.decode(str));
String personDetailsToJson(PersonDetails data) => json.encode(data.toJson());
class PersonDetails {
  PersonDetails({
      bool? adult, 
      List<String>? alsoKnownAs, 
      String? biography, 
      String? birthday, 
      String? deathday, 
      num? gender, 
      String? homepage, 
      num? id, 
      String? imdbId, 
      String? knownForDepartment, 
      String? name, 
      String? placeOfBirth, 
      num? popularity, 
      String? profilePath,}){
    _adult = adult;
    _alsoKnownAs = alsoKnownAs;
    _biography = biography;
    _birthday = birthday;
    _deathday = deathday;
    _gender = gender;
    _homepage = homepage;
    _id = id;
    _imdbId = imdbId;
    _knownForDepartment = knownForDepartment;
    _name = name;
    _placeOfBirth = placeOfBirth;
    _popularity = popularity;
    _profilePath = profilePath;
}

  PersonDetails.fromJson(dynamic json) {
    _adult = json['adult'];
    _alsoKnownAs = json['also_known_as'] != null ? json['also_known_as'].cast<String>() : [];
    _biography = json['biography'];
    _birthday = json['birthday'];
    _deathday = json['deathday'];
    _gender = json['gender'];
    _homepage = json['homepage'];
    _id = json['id'];
    _imdbId = json['imdb_id'];
    _knownForDepartment = json['known_for_department'];
    _name = json['name'];
    _placeOfBirth = json['place_of_birth'];
    _popularity = json['popularity'];
    _profilePath = json['profile_path'];
  }
  bool? _adult;
  List<String>? _alsoKnownAs;
  String? _biography;
  String? _birthday;
  String? _deathday;
  num? _gender;
  String? _homepage;
  num? _id;
  String? _imdbId;
  String? _knownForDepartment;
  String? _name;
  String? _placeOfBirth;
  num? _popularity;
  String? _profilePath;

  bool get adult => _adult ?? false;
  List<String> get alsoKnownAs => _alsoKnownAs ?? [];
  String get biography => _biography ?? '';
  String get birthday => _birthday ?? '';
  String get deathday => _deathday ?? '';
  num get gender => _gender ?? 0;
  String get homepage => _homepage ?? '';
  num get id => _id ?? 0;
  String get imdbId => _imdbId ?? '';
  String get knownForDepartment => _knownForDepartment ?? '';
  String get name => _name ?? '';
  String get placeOfBirth => _placeOfBirth ?? '';
  num get popularity => _popularity ?? 0;
  String get profilePath => _profilePath ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['adult'] = _adult;
    map['also_known_as'] = _alsoKnownAs;
    map['biography'] = _biography;
    map['birthday'] = _birthday;
    map['deathday'] = _deathday;
    map['gender'] = _gender;
    map['homepage'] = _homepage;
    map['id'] = _id;
    map['imdb_id'] = _imdbId;
    map['known_for_department'] = _knownForDepartment;
    map['name'] = _name;
    map['place_of_birth'] = _placeOfBirth;
    map['popularity'] = _popularity;
    map['profile_path'] = _profilePath;
    return map;
  }
}