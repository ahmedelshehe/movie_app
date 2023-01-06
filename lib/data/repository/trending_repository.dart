import 'package:movies_app/data/models/tvshow.dart';

import '../models/movie.dart';
import '../web_services/trending_web_service.dart';

class TrendingRepository{
  final TrendingWebService trendingWebService;

  TrendingRepository(this.trendingWebService);
  
  Future<List> getTrending() async{
    List trendingToday=[];
    final trendingTodayItems =await trendingWebService.getTrendingToday().catchError((e){throw(e);});
    for(dynamic item in trendingTodayItems){
      if(item['media_type']=='movie'){
        trendingToday.add(Movie.fromJson(item));
      } else if(item['media_type']=='tv'){
        trendingToday.add(TvShow.fromJson(item));
      }
    }
    return trendingToday;
  }
  
}