import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import '../../constants/end_points.dart';

class TvShowsWebService{
  late Dio dio;
  TvShowsWebService(){
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: 30*1000,
      receiveTimeout: 30*1000,
    );
    dio=Dio(options);
  }
  Future<List> getPopularTvShows() async{
    try{
      Response response=await dio.get(popularTVShows,queryParameters:{'api_key': apiKey} );
      return response.data['results'];
    }catch(e){
      rethrow;
    }
  }
  Future<List> getTopTvShows() async{
    try{
      Response response=await dio.get(topTVShows,queryParameters:{'api_key': apiKey} );
      return response.data['results'];
    }catch(e){
      rethrow;
    }
  }
}