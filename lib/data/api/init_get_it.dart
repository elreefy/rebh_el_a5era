//init get it
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import '../../business_logic/azkar_cubit/azkar_cubit.dart';
import '../../business_logic/azkar_cubit/quraan_cubit.dart';
import '../repository/social_repository.dart';
import 'dio_helper.dart';
final getIt = GetIt.instance;
void initGetIt() {
  getIt.registerLazySingleton<AzkarCubit>(() => AzkarCubit(getIt()));
  getIt.registerLazySingleton<QuraanCubit>(() => QuraanCubit());
  getIt.registerLazySingleton<RestClient>(() => RestClient(createAndSetupDio()));
  //social Repository
  getIt.registerLazySingleton<AzkarRepository>(() => AzkarRepository(getIt()));
}

Dio createAndSetupDio() {
  final dio = Dio();
//  dio.options.baseUrl = 'https://www.mp3quran.net/api';
  dio.options.connectTimeout = 5000;
  //dio.options.receiveTimeout = 3000;
  dio.interceptors.add(LogInterceptor(
      responseBody: true,
     error: true,
    logPrint: (obj) => debugPrint(obj.toString()),
    request: true,
    requestBody: true,
    requestHeader: true,
    responseHeader: true,
  ));
  return dio;
}
