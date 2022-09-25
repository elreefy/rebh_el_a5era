

import 'dart:convert';
import 'dart:io';

import 'package:rebh_el_a5era/data/models/Azkar_model.dart';

import '../../shared/constants/strings.dart';
import '../api/dio_helper.dart';
import '../azkar_db.dart';
import '../models/RadioModel.dart';
import '../models/Radio_model.dart';
import '../models/SurahModel.dart';
import '../models/quraan_model.dart';

//



class AzkarRepository {
  final RestClient restClient;

  AzkarRepository(this.restClient);


  //get quran using rest client and return it as list of Quraan model
  Future<QuraanModel> getQuraan(
      num surahNumber) async {
    //get surah using rest client then map it to return list of surah model
    final response=await restClient.getQuran(surahNumber);
    return QuraanModel.fromJson(response);
  }

  //get surah using rest client
  Future<SurahModel> getAllsurah() async {
    //get surah using rest client then map it to return list of surah model
    final response=await restClient.getAllSurah();
    return SurahModel.fromJson(response);
  }
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
  //get Radio using rest client
  Future<List<RadioModel>?> getRadio() async {
    try {
      //save restClient.getRadio() in resonse variable
      final response = await restClient.getRadio();
      //use json decode to convert response to map
      final Map<String, dynamic> responseBody = jsonDecode(response);
      //use responseBody to get the list of radios
      var radiosListBody = responseBody['Radios'] as List;
      //create list of radios
      List<RadioModel> radiosList = [];
      //loop on radiosListBody to add each radio to radiosList
      for (var radio in radiosListBody) {
        radiosList.add(RadioModel.fromJson(radio));
      }

      print('dh fel repoooooo::::::::::::\n\n\n\n\n\n\n\n\n');
      print(radiosList[0].name);
      return radiosList;
    } catch (e) {
      print(e.toString());
     // return e.toString();
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
}
