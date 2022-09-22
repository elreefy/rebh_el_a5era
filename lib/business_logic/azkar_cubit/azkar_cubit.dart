import 'dart:ffi';
import 'dart:io';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as Path;
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/api/dio_helper.dart';
import '../../data/cashe_helper.dart';
import '../../data/models/Azkar_model.dart';
import '../../data/models/RadioModel.dart';
import '../../data/models/Radio_model.dart';
import '../../data/models/SurahModel.dart';
import '../../data/repository/social_repository.dart';
import '../../presentation/screens/screens/azkar_screen.dart';
import '../../presentation/screens/screens/quraan_screen.dart';
import '../../shared/constants/strings.dart';
part 'azkar_state.dart';

class AzkarCubit extends Cubit<SocialState> {
  var isPassword = true;
  //final  RestClient restClient;
  final AzkarRepository azkarRepository;

  var imageController=TextEditingController();

  var profileImageController=TextEditingController();
  AzkarCubit(this.azkarRepository) : super(SocialInitial());

  var postController =
      TextEditingController(); //this controller for post text
  static AzkarCubit get(context) => BlocProvider.of(context);
  //screens for bottom navigation bar
  int currentIndex = 0;
  List<Widget> screens = [
    AzkarScreen(),
    QuraanScreen(),
   // SurahScreen(),
  // ProfileScreen(),
  ];
  List<String> titles = [
    'أذكار',
    'القرآن الكريم',
  ];
  //change bottom navigation bar index
  void changeBottom(int index) {
    currentIndex = index;
    emit(SocialChangeBottomNavState());
  }
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
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  IconData icon = Icons.play_arrow_rounded;
  void playRadio() {
    if (isPlaying) {
      audioPlayer.pause();
      isPlaying = false;
      icon = Icons.play_arrow_rounded;
      emit(SocialRadioPlayState());
    } else {
      audioPlayer.play(tarateelUrl);
      isPlaying = true;
      icon = Icons.pause;
      emit(SocialRadioPlayState());
    }
     }
     //load audio from assets (assets/images/WhatsApp Audio 2022-09-22 at 3.33.39 AM.mpeg) using audioCache package and play it using audioplayers package
     AudioCache audioCache = AudioCache();
     bool isPlayingMorningAudio = false;
     IconData iconAudio = Icons.play_arrow_rounded;
     void playMorningAudio() {
       if (isPlayingMorningAudio) {
         //pause   audioCache
          audioCache.fixedPlayer?.pause();

           audioPlayer.pause();
           audioPlayer.stop();
           audioPlayer.release();
           audioPlayer.dispose();
           audioPlayer.seek(Duration(seconds: 0));
           audioPlayer.setVolume(0);
           audioPlayer.setReleaseMode(ReleaseMode.STOP);
         // pause   audioCache
           audioCache.fixedPlayer?.pause();
           audioCache.fixedPlayer?.stop();
           audioCache.fixedPlayer?.release();
           audioCache.fixedPlayer?.dispose();
             audioCache.fixedPlayer?.seek(Duration(seconds: 0));
             audioCache.fixedPlayer?.setVolume(0);
             audioCache.fixedPlayer?.setReleaseMode(ReleaseMode.STOP);

         audioCache.clearAll();
//         audioCache.clear();
         audioCache.loadedFiles.clear();
         //audioCache.loadedFiles.clear();
          audioCache.fixedPlayer?.dispose();
         audioPlayer.pause();
         isPlayingMorningAudio = false;
         iconAudio = Icons.play_arrow_rounded;
         emit(SocialAudioPlayState());
       } else {
         //play  audioCache using fixedPlayer and play audio using audioPlayer
         //set volume to 1
         //set release mode to play and loop

          audioCache.fixedPlayer?.setReleaseMode(ReleaseMode.LOOP);
          audioCache.fixedPlayer?.setVolume(0.1);
         // audioCache.fixedPlayer?.play('assets/images/WhatsApp Audio 2022-09-22 at 3.33.39 AM.mpeg');
          audioCache.play('images/WhatsApp Audio 2022-09-22 at 3.33.39 AM.mpeg');
         isPlayingMorningAudio = true;
         iconAudio = Icons.pause;
         emit(SocialAudioPlayState());
       }
     }
     //get list of surah from repository and save it in surah list
     //List<SurahModel>? surahList = [];
     SurahModel? surahModel;
     Future<Void?> getAllSurah() async {
     emit(SocialGetAzkarLoadingState());
     try {
       surahModel = await azkarRepository.getAllsurah();
       print('\n\n\n\n\n');
       print('surah list is dh fel cubit${surahModel!.data![0].name}');
       print('surah list is dh fel cubit${surahModel!.data![0].number}');
       print('surah list is dh fel cubit${surahModel!.data![0].englishName}');
       print('\n\n\n\n\n');
    } catch (e) {
      print(e.toString());
    }
  }

}


