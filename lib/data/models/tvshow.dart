import 'dart:convert';
TvShow tvShowFromJson(String str) => TvShow.fromJson(json.decode(str));
String tvShowToJson(TvShow data) => json.encode(data.toJson());
class TvShow {
  TvShow({
      String? backdropPath, 
      List<CreatedBy>? createdBy, 
      List<num>? episodeRunTime, 
      String? firstAirDate, 
      List<Genres>? genres, 
      String? homepage, 
      num? id, 
      bool? inProduction, 
      List<String>? languages, 
      String? lastAirDate, 
      LastEpisodeToAir? lastEpisodeToAir, 
      String? name, 
      dynamic nextEpisodeToAir, 
      List<Networks>? networks, 
      num? numberOfEpisodes, 
      num? numberOfSeasons, 
      List<String>? originCountry, 
      String? originalLanguage, 
      String? originalName, 
      String? overview, 
      num? popularity, 
      String? posterPath, 
      List<ProductionCompanies>? productionCompanies, 
      List<ProductionCountries>? productionCountries, 
      List<Seasons>? seasons, 
      List<SpokenLanguages>? spokenLanguages, 
      String? status, 
      String? tagline, 
      String? type, 
      num? voteAverage, 
      num? voteCount,
      List<int>? genreIds
  }){
    _backdropPath = backdropPath;
    _createdBy = createdBy;
    _episodeRunTime = episodeRunTime;
    _firstAirDate = firstAirDate;
    _genres = genres;
    _homepage = homepage;
    _id = id;
    _inProduction = inProduction;
    _languages = languages;
    _lastAirDate = lastAirDate;
    _lastEpisodeToAir = lastEpisodeToAir;
    _name = name;
    _nextEpisodeToAir = nextEpisodeToAir;
    _networks = networks;
    _numberOfEpisodes = numberOfEpisodes;
    _numberOfSeasons = numberOfSeasons;
    _originCountry = originCountry;
    _originalLanguage = originalLanguage;
    _originalName = originalName;
    _overview = overview;
    _popularity = popularity;
    _posterPath = posterPath;
    _productionCompanies = productionCompanies;
    _productionCountries = productionCountries;
    _seasons = seasons;
    _spokenLanguages = spokenLanguages;
    _status = status;
    _tagline = tagline;
    _type = type;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
    _genreIds =genreIds;
  }

  TvShow.fromJson(dynamic json) {
    _backdropPath = json['backdrop_path'];
    if (json['created_by'] != null) {
      _createdBy = [];
      json['created_by'].forEach((v) {
        _createdBy?.add(CreatedBy.fromJson(v));
      });
    }
    _episodeRunTime = json['episode_run_time'] != null ? json['episode_run_time'].cast<num>() : [];
    _firstAirDate = json['first_air_date'];
    if (json['genres'] != null) {
      _genres = [];
      json['genres'].forEach((v) {
        _genres?.add(Genres.fromJson(v));
      });
    }
    _genreIds = json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [];
    _homepage = json['homepage'];
    _id = json['id'];
    _inProduction = json['in_production'];
    _languages = json['languages'] != null ? json['languages'].cast<String>() : [];
    _lastAirDate = json['last_air_date'];
    _lastEpisodeToAir = json['last_episode_to_air'] != null ? LastEpisodeToAir.fromJson(json['last_episode_to_air']) : null;
    _name = json['name'];
    _nextEpisodeToAir = json['next_episode_to_air'];
    if (json['networks'] != null) {
      _networks = [];
      json['networks'].forEach((v) {
        _networks?.add(Networks.fromJson(v));
      });
    }
    _numberOfEpisodes = json['number_of_episodes'];
    _numberOfSeasons = json['number_of_seasons'];
    _originCountry = json['origin_country'] != null ? json['origin_country'].cast<String>() : [];
    _originalLanguage = json['original_language'];
    _originalName = json['original_name'];
    _overview = json['overview'];
    _popularity = json['popularity'];
    _posterPath = json['poster_path'];
    if (json['production_companies'] != null) {
      _productionCompanies = [];
      json['production_companies'].forEach((v) {
        _productionCompanies?.add(ProductionCompanies.fromJson(v));
      });
    }
    if (json['production_countries'] != null) {
      _productionCountries = [];
      json['production_countries'].forEach((v) {
        _productionCountries?.add(ProductionCountries.fromJson(v));
      });
    }
    if (json['seasons'] != null) {
      _seasons = [];
      json['seasons'].forEach((v) {
        _seasons?.add(Seasons.fromJson(v));
      });
    }
    if (json['spoken_languages'] != null) {
      _spokenLanguages = [];
      json['spoken_languages'].forEach((v) {
        _spokenLanguages?.add(SpokenLanguages.fromJson(v));
      });
    }
    _status = json['status'];
    _tagline = json['tagline'];
    _type = json['type'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  String? _backdropPath;
  List<CreatedBy>? _createdBy;
  List<num>? _episodeRunTime;
  String? _firstAirDate;
  List<Genres>? _genres;
  String? _homepage;
  num? _id;
  bool? _inProduction;
  List<String>? _languages;
  String? _lastAirDate;
  LastEpisodeToAir? _lastEpisodeToAir;
  String? _name;
  dynamic _nextEpisodeToAir;
  List<Networks>? _networks;
  num? _numberOfEpisodes;
  num? _numberOfSeasons;
  List<String>? _originCountry;
  String? _originalLanguage;
  String? _originalName;
  String? _overview;
  num? _popularity;
  String? _posterPath;
  List<ProductionCompanies>? _productionCompanies;
  List<ProductionCountries>? _productionCountries;
  List<Seasons>? _seasons;
  List<SpokenLanguages>? _spokenLanguages;
  String? _status;
  String? _tagline;
  String? _type;
  num? _voteAverage;
  num? _voteCount;
  List<num>? _genreIds;
  String get backdropPath => _backdropPath ?? '';
  List<CreatedBy>? get createdBy => _createdBy;
  List<num>? get episodeRunTime => _episodeRunTime;
  String get firstAirDate => _firstAirDate ?? '';
  List<Genres>? get genres => _genres;
  String get homepage => _homepage ?? '';
  num get id => _id ?? 0;
  bool get inProduction => _inProduction ?? false;
  List<String>? get languages => _languages;
  String get lastAirDate => _lastAirDate ?? '';
  LastEpisodeToAir? get lastEpisodeToAir => _lastEpisodeToAir;
  String get name => _name ?? '';
  dynamic get nextEpisodeToAir => _nextEpisodeToAir;
  List<Networks>? get networks => _networks;
  num get numberOfEpisodes => _numberOfEpisodes ?? 0;
  num get numberOfSeasons => _numberOfSeasons ?? 0;
  List<String>? get originCountry => _originCountry;
  String get originalLanguage => _originalLanguage ?? '';
  String get originalName => _originalName ?? '';
  String get overview => _overview ?? '';
  num get popularity => _popularity ?? 0;
  String get posterPath => _posterPath ?? '';
  List<ProductionCompanies>? get productionCompanies => _productionCompanies;
  List<ProductionCountries>? get productionCountries => _productionCountries;
  List<Seasons>? get seasons => _seasons;
  List<SpokenLanguages>? get spokenLanguages => _spokenLanguages;
  String get status => _status ?? '';
  String get tagline => _tagline ?? '';
  String get type => _type ?? '';
  num get voteAverage => _voteAverage ?? 0;
  num get voteCount => _voteCount ?? 0;
  List<num> get genreIds => _genreIds ??[];
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['backdrop_path'] = _backdropPath;
    if (_createdBy != null) {
      map['created_by'] = _createdBy?.map((v) => v.toJson()).toList();
    }
    map['episode_run_time'] = _episodeRunTime;
    map['first_air_date'] = _firstAirDate;
    if (_genres != null) {
      map['genres'] = _genres?.map((v) => v.toJson()).toList();
    }
    map['homepage'] = _homepage;
    map['id'] = _id;
    map['in_production'] = _inProduction;
    map['languages'] = _languages;
    map['last_air_date'] = _lastAirDate;
    if (_lastEpisodeToAir != null) {
      map['last_episode_to_air'] = _lastEpisodeToAir?.toJson();
    }
    map['name'] = _name;
    map['next_episode_to_air'] = _nextEpisodeToAir;
    if (_networks != null) {
      map['networks'] = _networks?.map((v) => v.toJson()).toList();
    }
    map['number_of_episodes'] = _numberOfEpisodes;
    map['number_of_seasons'] = _numberOfSeasons;
    map['origin_country'] = _originCountry;
    map['original_language'] = _originalLanguage;
    map['original_name'] = _originalName;
    map['overview'] = _overview;
    map['popularity'] = _popularity;
    map['poster_path'] = _posterPath;
    if (_productionCompanies != null) {
      map['production_companies'] = _productionCompanies?.map((v) => v.toJson()).toList();
    }
    if (_productionCountries != null) {
      map['production_countries'] = _productionCountries?.map((v) => v.toJson()).toList();
    }
    if (_seasons != null) {
      map['seasons'] = _seasons?.map((v) => v.toJson()).toList();
    }
    if (_spokenLanguages != null) {
      map['spoken_languages'] = _spokenLanguages?.map((v) => v.toJson()).toList();
    }
    map['status'] = _status;
    map['tagline'] = _tagline;
    map['type'] = _type;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}

SpokenLanguages spokenLanguagesFromJson(String str) => SpokenLanguages.fromJson(json.decode(str));
String spokenLanguagesToJson(SpokenLanguages data) => json.encode(data.toJson());
class SpokenLanguages {
  SpokenLanguages({
      String? englishName, 
      String? iso6391, 
      String? name,}){
    _englishName = englishName;
    _iso6391 = iso6391;
    _name = name;
}

  SpokenLanguages.fromJson(dynamic json) {
    _englishName = json['english_name'];
    _iso6391 = json['iso_639_1'];
    _name = json['name'];
  }
  String? _englishName;
  String? _iso6391;
  String? _name;

  String get englishName => _englishName ?? '';
  String get iso6391 => _iso6391 ?? '';
  String get name => _name ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['english_name'] = _englishName;
    map['iso_639_1'] = _iso6391;
    map['name'] = _name;
    return map;
  }

}

Seasons seasonsFromJson(String str) => Seasons.fromJson(json.decode(str));
String seasonsToJson(Seasons data) => json.encode(data.toJson());
class Seasons {
  Seasons({
      String? airDate, 
      num? episodeCount, 
      num? id, 
      String? name, 
      String? overview, 
      String? posterPath, 
      num? seasonNumber,}){
    _airDate = airDate;
    _episodeCount = episodeCount;
    _id = id;
    _name = name;
    _overview = overview;
    _posterPath = posterPath;
    _seasonNumber = seasonNumber;
}

  Seasons.fromJson(dynamic json) {
    _airDate = json['air_date'];
    _episodeCount = json['episode_count'];
    _id = json['id'];
    _name = json['name'];
    _overview = json['overview'];
    _posterPath = json['poster_path'];
    _seasonNumber = json['season_number'];
  }
  String? _airDate;
  num? _episodeCount;
  num? _id;
  String? _name;
  String? _overview;
  String? _posterPath;
  num? _seasonNumber;

  String get airDate => _airDate ?? '';
  num get episodeCount => _episodeCount ?? 0;
  num get id => _id ?? 0;
  String get name => _name ?? '';
  String get overview => _overview ?? '';
  String get posterPath => _posterPath ?? '';
  num get seasonNumber => _seasonNumber ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['air_date'] = _airDate;
    map['episode_count'] = _episodeCount;
    map['id'] = _id;
    map['name'] = _name;
    map['overview'] = _overview;
    map['poster_path'] = _posterPath;
    map['season_number'] = _seasonNumber;
    return map;
  }

}

ProductionCountries productionCountriesFromJson(String str) => ProductionCountries.fromJson(json.decode(str));
String productionCountriesToJson(ProductionCountries data) => json.encode(data.toJson());
class ProductionCountries {
  ProductionCountries({
      String? iso31661, 
      String? name,}){
    _iso31661 = iso31661;
    _name = name;
}

  ProductionCountries.fromJson(dynamic json) {
    _iso31661 = json['iso_3166_1'];
    _name = json['name'];
  }
  String? _iso31661;
  String? _name;

  String get iso31661 => _iso31661 ?? '';
  String get name => _name ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['iso_3166_1'] = _iso31661;
    map['name'] = _name;
    return map;
  }

}

ProductionCompanies productionCompaniesFromJson(String str) => ProductionCompanies.fromJson(json.decode(str));
String productionCompaniesToJson(ProductionCompanies data) => json.encode(data.toJson());
class ProductionCompanies {
  ProductionCompanies({
      num? id, 
      String? logoPath, 
      String? name, 
      String? originCountry,}){
    _id = id;
    _logoPath = logoPath;
    _name = name;
    _originCountry = originCountry;
}

  ProductionCompanies.fromJson(dynamic json) {
    _id = json['id'];
    _logoPath = json['logo_path'];
    _name = json['name'];
    _originCountry = json['origin_country'];
  }
  num? _id;
  String? _logoPath;
  String? _name;
  String? _originCountry;

  num get id => _id ?? 0;
  String get logoPath => _logoPath ?? '';
  String get name => _name ?? '';
  String get originCountry => _originCountry ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['logo_path'] = _logoPath;
    map['name'] = _name;
    map['origin_country'] = _originCountry;
    return map;
  }

}

Networks networksFromJson(String str) => Networks.fromJson(json.decode(str));
String networksToJson(Networks data) => json.encode(data.toJson());
class Networks {
  Networks({
      String? name, 
      num? id, 
      String? logoPath, 
      String? originCountry,}){
    _name = name;
    _id = id;
    _logoPath = logoPath;
    _originCountry = originCountry;
}

  Networks.fromJson(dynamic json) {
    _name = json['name'];
    _id = json['id'];
    _logoPath = json['logo_path'];
    _originCountry = json['origin_country'];
  }
  String? _name;
  num? _id;
  String? _logoPath;
  String? _originCountry;

  String get name => _name ?? '';
  num get id => _id ?? 0;
  String get logoPath => _logoPath ?? '';
  String get originCountry => _originCountry ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = _name;
    map['id'] = _id;
    map['logo_path'] = _logoPath;
    map['origin_country'] = _originCountry;
    return map;
  }

}

LastEpisodeToAir lastEpisodeToAirFromJson(String str) => LastEpisodeToAir.fromJson(json.decode(str));
String lastEpisodeToAirToJson(LastEpisodeToAir data) => json.encode(data.toJson());
class LastEpisodeToAir {
  LastEpisodeToAir({
      String? airDate, 
      num? episodeNumber, 
      num? id, 
      String? name, 
      String? overview, 
      String? productionCode, 
      num? seasonNumber, 
      String? stillPath, 
      num? voteAverage, 
      num? voteCount,}){
    _airDate = airDate;
    _episodeNumber = episodeNumber;
    _id = id;
    _name = name;
    _overview = overview;
    _productionCode = productionCode;
    _seasonNumber = seasonNumber;
    _stillPath = stillPath;
    _voteAverage = voteAverage;
    _voteCount = voteCount;
}

  LastEpisodeToAir.fromJson(dynamic json) {
    _airDate = json['air_date'];
    _episodeNumber = json['episode_number'];
    _id = json['id'];
    _name = json['name'];
    _overview = json['overview'];
    _productionCode = json['production_code'];
    _seasonNumber = json['season_number'];
    _stillPath = json['still_path'];
    _voteAverage = json['vote_average'];
    _voteCount = json['vote_count'];
  }
  String? _airDate;
  num? _episodeNumber;
  num? _id;
  String? _name;
  String? _overview;
  String? _productionCode;
  num? _seasonNumber;
  String? _stillPath;
  num? _voteAverage;
  num? _voteCount;

  String get airDate => _airDate ?? '';
  num get episodeNumber => _episodeNumber ?? 0;
  num get id => _id ?? 0;
  String get name => _name ?? '';
  String get overview => _overview ?? '';
  String get productionCode => _productionCode ?? '';
  num get seasonNumber => _seasonNumber ?? 0;
  String get stillPath => _stillPath ?? '';
  num get voteAverage => _voteAverage ?? 0;
  num get voteCount => _voteCount ?? 0;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['air_date'] = _airDate;
    map['episode_number'] = _episodeNumber;
    map['id'] = _id;
    map['name'] = _name;
    map['overview'] = _overview;
    map['production_code'] = _productionCode;
    map['season_number'] = _seasonNumber;
    map['still_path'] = _stillPath;
    map['vote_average'] = _voteAverage;
    map['vote_count'] = _voteCount;
    return map;
  }

}

Genres genresFromJson(String str) => Genres.fromJson(json.decode(str));
String genresToJson(Genres data) => json.encode(data.toJson());
class Genres {
  Genres({
      num? id, 
      String? name,}){
    _id = id;
    _name = name;
}

  Genres.fromJson(dynamic json) {
    _id = json['id'];
    _name = json['name'];
  }
  num? _id;
  String? _name;

  num get id => _id ?? 0;
  String get name => _name ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['name'] = _name;
    return map;
  }

}

CreatedBy createdByFromJson(String str) => CreatedBy.fromJson(json.decode(str));
String createdByToJson(CreatedBy data) => json.encode(data.toJson());
class CreatedBy {
  CreatedBy({
      num? id, 
      String? creditId, 
      String? name, 
      num? gender, 
      String? profilePath,}){
    _id = id;
    _creditId = creditId;
    _name = name;
    _gender = gender;
    _profilePath = profilePath;
}

  CreatedBy.fromJson(dynamic json) {
    _id = json['id'];
    _creditId = json['credit_id'];
    _name = json['name'];
    _gender = json['gender'];
    _profilePath = json['profile_path'];
  }
  num? _id;
  String? _creditId;
  String? _name;
  num? _gender;
  String? _profilePath;

  num get id => _id ?? 0;
  String get creditId => _creditId ?? '';
  String get name => _name ?? '';
  num get gender => _gender ?? 0;
  String get profilePath => _profilePath ?? '';

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['credit_id'] = _creditId;
    map['name'] = _name;
    map['gender'] = _gender;
    map['profile_path'] = _profilePath;
    return map;
  }

}