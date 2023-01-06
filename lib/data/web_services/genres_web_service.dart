import 'package:dio/dio.dart';
import 'package:movies_app/constants/end_points.dart';

import '../../constants/constants.dart';

class GenresWebService{
  late Dio dio;

  GenresWebService(){
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: 30*1000,
      receiveTimeout: 30*1000,
    );
    dio=Dio(options);
  }
  Future<List> getMovieGenres() async{
    try{
      Response response=await dio.get(movieGenres,queryParameters:{'api_key': apiKey} );
      return response.data['genres'];
    }catch(e){
      rethrow;
    }
  }
  Future<List> getTvShowGenres() async{
    try{
      Response response=await dio.get(tvShowGenres,queryParameters:{'api_key': apiKey} );
      return response.data['genres'];
    }catch(e){
      rethrow;
    }
  }
}