

import 'dart:io';

import 'package:rebh_el_a5era/data/models/Azkar_model.dart';

import '../../shared/constants/strings.dart';
import '../api/dio_helper.dart';
import '../azkar_db.dart';

class AzkarRepository {
  final RestClient restClient;

  AzkarRepository(this.restClient);
  //get azkar from list db where category = 'أذكار الصباح'
  Future getAllAzkar() async {
    try {
 //List<AzkarModel> respnse=
 //  print(respnse[0].category);
      return db.map((zakerObjectFromJson) => AzkarModel.fromJson(zakerObjectFromJson)).toList();

    } on SocketException catch (_) {
      return 'No Internet Connection';
    } catch (e) {
      return e.toString();
    }
  }
  //get azkar from list db where category = 'أذكار المساء'
  // Future getEveningAzkar() async {
  //   try {
  //     var response = await restClient.getAzkar();
  //     if (response.statusCode == 200) {
  //       return response.data['data'];
  //     } else {
  //       return null;
  //     }
  //   } on SocketException catch (_) {
  //     return Strings.noInternetConnection;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }
  //get azkar from list db where category = 'أذكار النوم'
  // Future getSleepAzkar() async {
  //   try {
  //     var response = await restClient.getAzkar();
  //     if (response.statusCode == 200) {
  //       return response.data['data'];
  //     } else {
  //       return null;
  //     }
  //   } on SocketException catch (_) {
  //     return Strings.noInternetConnection;
  //   } catch (e) {
  //     return e.toString();
  //   }
  // }


}