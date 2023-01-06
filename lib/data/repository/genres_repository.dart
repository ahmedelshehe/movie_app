import 'package:movies_app/data/web_services/genres_web_service.dart';

import '../models/genre.dart';

class GenresRepository{
  final GenresWebService genresWebService;

  GenresRepository(this.genresWebService);

  Future<List<Genre>> getMovieGenres() async{
    final genres =await genresWebService.getMovieGenres().catchError((e){throw(e);});
    return genres.map((genre) => Genre.fromJson(genre)).toList();
  }
  Future<List<Genre>> getTvShowGenres() async{
    final genres =await genresWebService.getTvShowGenres().catchError((e){throw(e);});
    return genres.map((genre) => Genre.fromJson(genre)).toList();
  }
}