import 'dart:ffi';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';

import 'package:path/path.dart' as Path;
import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/api/dio_helper.dart';
import '../../data/cashe_helper.dart';
import '../../data/models/Azkar_model.dart';
import '../../data/models/RadioModel.dart';
import '../../data/models/Radio_model.dart';
import '../../data/models/SurahModel.dart';
import '../../data/models/quraan_model.dart';
import '../../data/repository/social_repository.dart';
import '../../presentation/screens/screens/azkar_screen.dart';
import '../../presentation/screens/screens/quraan_screen.dart';
import '../../shared/constants/strings.dart';
part 'azkar_state.dart';

class AzkarCubit extends Cubit<AzkarState> {
  var isPassword = true;
  //final  RestClient restClient;
  final AzkarRepository azkarRepository;
  String? lastSeen='';
  var imageController=TextEditingController();

  var profileImageController=TextEditingController();
  AzkarCubit(this.azkarRepository) : super(SocialInitial());

  var postController =
      TextEditingController(); //this controller for post text
  static AzkarCubit get(context) => BlocProvider.of(context);
  //screens for bottom navigation bar

  //get azkar from repository and save it in azkar list
  List<AzkarModel>? azkarList = [];
 Future<Void?> getAllAzkar() async {
    emit(SocialGetAzkarLoadingState());
    azkarList = await azkarRepository.getAllAzkar().then(( value) async {
   //   print('azkar list is dh fel cubit$azkarList');
   // await  value.map((e) => azkarList!.add(e));
      print('azkar list is dh fel cubit$azkarList');
      print(value[0].category);


   emit(SocialGetAzkarSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetAzkarErrorState(error.toString()));
    });
  }
  //get azkar from repository and save it in morningAzkar list if category = 'أذكار الصباح'
  List<AzkarModel>? morningAzkarList = [];
  Future<Void?> getMorningAzkar() async {
    emit(SocialGetAzkarLoadingState());
     await azkarRepository.getAllAzkar().then(( value) async {
      //   print('azkar list is dh fel cubit$azkarList');
      // await  value.map((e) => azkarList!.add(e));
     // print('azkar list is dh fel cubit$azkarList');
     // print(value[0].category);
      value.map((e) {
        if(e.category=='أذكار الصباح'){
          morningAzkarList!.add(e);
        }
      }).toList();
    //  print('morning azkar list is dh fel cubit${morningAzkarList![3].category}');
      emit(SocialGetAzkarSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetAzkarErrorState(error.toString()));
    });
    }
//get azkar from repository and save it in eveningAzkar list if category = 'أذكار المساء'
  List<AzkarModel>? eveningAzkarList = [];
  Future<Void?> getEveningAzkar() async {
    emit(SocialGetAzkarLoadingState());
    await azkarRepository.getAllAzkar().then(( value) async {
      //   print('azkar list is dh fel cubit$azkarList');
      // await  value.map((e) => azkarList!.add(e));
      // print('azkar list is dh fel cubit$azkarList');
      // print(value[0].category);
      value.map((e) {
        if(e.category=='أذكار المساء'){
          eveningAzkarList!.add(e);
        }
      }).toList();
    //  print('evening azkar list is dh fel cubit${eveningAzkarList![3].category}');
      emit(SocialGetAzkarSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetAzkarErrorState(error.toString()));
    });
  }
  //get azkar from repository and save it in sleepAzkar list if category = 'أذكار النوم'
  List<AzkarModel>? sleepAzkarList = [];
  Future<Void?> getSleepAzkar() async {
    emit(SocialGetAzkarLoadingState());
    await azkarRepository.getAllAzkar().then(( value) async {
      //   print('azkar list is dh fel cubit$azkarList');
      // await  value.map((e) => azkarList!.add(e));
      // print('azkar list is dh fel cubit$azkarList');
      // print(value[0].category);
      value.map((e) {
        if(e.category=='أذكار النوم'){
          sleepAzkarList!.add(e);
        }
      }).toList();
    //  print('sleep azkar list is dh fel cubit${sleepAzkarList![3].category}');
      emit(SocialGetAzkarSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetAzkarErrorState(error.toString()));
    });
  }
//get radio from repository and save it in radio list
  RadioModel? radioModel;
 //String? tarateelUrl;\
  //list of  radioModel
  List<RadioModel>? radioList = [];
  Future<Void?> getAllRadio() async {
    emit(SocialGetAzkarLoadingState());
    try {
      radioList = await azkarRepository.getRadio();
      print('\n\n\n\n\n');
      print('radio list is dh fel cubit${radioList![0].url}');
      print('\n\n\n\n\n');
    } catch (e) {
      print(e.toString());
    }
  }
    //use audioplayers package to play radio

  AudioPlayer audioPlayer2 = AudioPlayer();
  bool isPlayingMorningAudio = false;
  IconData iconAudio = Icons.play_arrow_rounded;
  void playMorningAudio() {
    if (isPlayingMorningAudio) {
      //pause   audioCache
      emit(MorningAzkarPauseAudioState());
      audioPlayer2.pause();
      isPlayingMorningAudio = false;
      iconAudio = Icons.play_arrow_rounded;
    } else {
      emit(MorningAzkarPlayAudioState());
      isPlayingMorningAudio = true;
      iconAudio = Icons.pause;
      audioPlayer2.setAsset
        ('assets/json/WhatsApp Audio 2022-09-22 at 3.33.39 AM.mpeg');
      audioPlayer2.play();
    }
  }
  bool isPlayingEveningAudio = false;
  void playEveningAudio() {
    if (isPlayingEveningAudio) {
      emit(EveningAzkarPauseAudioState());
      audioPlayer2.pause();
      isPlayingEveningAudio = false;
      iconAudio = Icons.play_arrow_rounded;
    } else {
      emit(EveningAzkarPlayAudioState());
      isPlayingEveningAudio = true;
      iconAudio = Icons.pause;
      audioPlayer2.setAsset
        ('assets/json/WhatsApp Audio 2022-09-26 at 10.38.09 PM.mpeg');

      audioPlayer2.play();
    }
  }
     //load audio from assets (assets/images/WhatsApp Audio 2022-09-22 at 3.33.39 AM.mpeg) using audioCache package and play it using audioplayers package
     //get list of surah from repository and save it in surah list
     //List<SurahModel>? surahList = [];
     SurahModel? surahModel;
     Future<Void?> getAllSurah() async {
     emit(SocialGetAzkarLoadingState());
     try {
       surahModel = await azkarRepository.getAllsurah();
     //   print('\n\n\n\n\n');
     //   print('surah list is dh fel cubit${surahModel!.data![0].name}');
     //   print('surah list is dh fel cubit${surahModel!.data![0].number}');
     //  print('surah list is dh fel cubit${surahModel!.data![0].englishName}');
      //  print('\n\n\n\n\n');
    } catch (e) {
      print(e.toString());
    }
  }
     QuraanModel? quraanModel;
     Future<Void?> getQuraan(
          {required num surahNumber,}
         ) async {
   //  emit(SocialGetAzkarLoadingState());
    emit(SocialGetQuraanLoadingState());
     try {
       quraanModel = await azkarRepository.getQuraan(
            surahNumber,
       );
       print('\n\n\n\n\n');
       print('ayah list is dh fel cubit${quraanModel!.data!.ayahs![0].text}');
       print('ayah list is dh fel cubit${quraanModel!.data!.ayahs![0].number}');
       print('ayah list is dh fel cubit${quraanModel!.data!.ayahs![0].juz}');
       print('\n\n\n\n\n');
       emit(SocialGetQuraanSuccessState());
    } catch (e) {
      print(e.toString());
      emit(SocialGetQuraanErrorState(e.toString()));
    }
  }
  //test getQuraan using unit test



}


