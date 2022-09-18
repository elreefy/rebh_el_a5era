//rest client abstract class with retrofit annotation and base url
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'dio_helper.g.dart';
@RestApi(baseUrl: 'http://api.alquran.cloud/v1/quran/quran-uthmani')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
//get azkar from api
  @GET('/azkar')
  Future getAzkar();

}