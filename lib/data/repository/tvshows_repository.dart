import 'package:movies_app/data/web_services/tvshows_web_service.dart';
import '../models/tvshow.dart';

class TvShowsRepository{
  final TvShowsWebService tvShowsWebService;

  TvShowsRepository(this.tvShowsWebService);

   Future<List<TvShow>> getPopularTvShows() async{
     final tvShows=await tvShowsWebService.getPopularTvShows().catchError((e){throw(e);});
     return tvShows.map((tvShow) => TvShow.fromJson(tvShow)).toList();
   }
  Future<List<TvShow>> getTopTvShows() async{
    final tvShows=await tvShowsWebService.getTopTvShows().catchError((e){throw(e);});
    return tvShows.map((tvShow) => TvShow.fromJson(tvShow)).toList();
  }
}
