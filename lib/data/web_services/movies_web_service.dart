import 'package:dio/dio.dart';
import 'package:movies_app/constants/constants.dart';
import 'package:movies_app/constants/end_points.dart';


class MoviesWebService{
  late Dio dio;
  MoviesWebService(){
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: 30*1000,
      receiveTimeout: 30*1000,
    );
    dio=Dio(options);
  }
  Future<List> getPopularMovies() async{
    try{
      Response response=await dio.get(popularMovies,queryParameters:{'api_key': apiKey} );
      return response.data['results'];
    }catch(e){
      rethrow;
    }
  }
  Future<List> getTopMovies() async{
    try{
      Response response=await dio.get(topMovies,queryParameters:{'api_key': apiKey} );
      return response.data['results'];
    }catch(e){
      rethrow;
    }
  }
  Future<List> getUpcomingMovies() async{
    try{
      Response response=await dio.get(upcomingMovies,queryParameters:{'api_key': apiKey} );
      return response.data['results'];
    }catch(e){
      rethrow;
    }
  }
}