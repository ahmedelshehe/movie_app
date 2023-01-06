import 'package:dio/dio.dart';
import 'package:movies_app/constants/end_points.dart';

import '../../constants/constants.dart';

class TrendingWebService{

  late Dio dio;
  TrendingWebService(){
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: 30*1000,
      receiveTimeout: 30*1000,
    );
    dio=Dio(options);
  }
  Future<List> getTrendingToday() async{
    try{
      Response response=await dio.get(trendingToday,queryParameters:{'api_key': apiKey} );
      return response.data['results'];
    }catch(e){
      rethrow;
    }
  }
}