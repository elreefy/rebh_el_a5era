//rest client abstract class with retrofit annotation and base url
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'dio_helper.g.dart';
@RestApi(baseUrl: 'http://api.alquran.cloud/v1')
//@RestApi(baseUrl: 'https://www.mp3quran.net/api')
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;
//get azkar from api
  @GET('/azkar/quran/quran-uthmani')
  Future getAzkar();
  //todo shof path from omar ahmed
  //get list of surah
  @GET('/surah')
  Future getSurah();
  //use this method to get quran from api
  @GET('/{surahNumber}')
  Future getQuran(
      @Path('surahNumber') int surahNumber);
  //  use this method to get quran from api
  @GET('/{surahNumber}/{ayahNumber}')
  Future getAyah
      (@Path('surahNumber') int surahNumber, @Path('ayahNumber') int ayahNumber);
  // baseurl https://www.mp3quran.net/api/
  @RestApi(baseUrl: 'https://www.mp3quran.net/api')
  @GET('/radio/radio_ar.json')
  Future getRadio();
}