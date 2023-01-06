import 'package:dio/dio.dart';

import '../../constants/constants.dart';
import '../../constants/end_points.dart';

class PersonsWebService{
  late Dio dio;
  PersonsWebService(){
    BaseOptions options = BaseOptions(
      baseUrl: baseURL,
      receiveDataWhenStatusError: true,
      connectTimeout: 30*1000,
      receiveTimeout: 30*1000,
    );
    dio=Dio(options);
  }
  Future<List> getPopularPersons() async{
    try{
      Response response=await dio.get(popularPersons,queryParameters:{'api_key': apiKey} );
      return response.data['results'];
    }catch(e){
      rethrow;
    }
  }
  Future getPerson(int id) async{
    try{
      Response response=await dio.get(pesonDetails+id.toString(),queryParameters:{'api_key': apiKey} );
      return response.data;
    }catch(e){
      rethrow;
    }
  }
}