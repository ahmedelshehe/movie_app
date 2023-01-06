import 'package:movies_app/data/web_services/movies_web_service.dart';

import '../models/movie.dart';

class MoviesRepository{
  final MoviesWebService moviesWebService;
  MoviesRepository(this.moviesWebService);
  Future<List<Movie>> getPopularMovies() async{
    final movies=await moviesWebService.getPopularMovies().catchError((e){throw(e);});
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  }
  Future<List<Movie>> getTopMovies() async{
    final movies=await moviesWebService.getTopMovies().catchError((e){throw(e);});
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  }
  Future<List<Movie>> getUpcomingMovies() async{
    final movies=await moviesWebService.getUpcomingMovies().catchError((e){throw(e);});
    return movies.map((movie) => Movie.fromJson(movie)).toList();
  }
}