import 'dart:ffi';
import 'dart:io';
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
import '../../data/repository/social_repository.dart';
import '../../shared/constants/strings.dart';
part 'social_state.dart';

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
      print('morning azkar list is dh fel cubit${morningAzkarList![3].category}');
      emit(SocialGetAzkarSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(SocialGetAzkarErrorState(error.toString()));
    });

    }
}
