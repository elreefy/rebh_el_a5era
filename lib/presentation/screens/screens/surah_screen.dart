import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//import BlocConsumer
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebh_el_a5era/shared/constants/app_size.dart';
import '../../../business_logic/azkar_cubit/azkar_cubit.dart';
import '../../../data/cashe_helper.dart';
import '../../../shared/constants/font_manager.dart';
import '../../../shared/constants/my_colors.dart';
import '../../../shared/constants/styles_manager.dart';

class SurahScreen extends StatelessWidget {
  final num surahNumber;
  final String surahName;
  const SurahScreen({Key? key, required this.surahNumber,  required this.surahName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        //save lastSeen in cache helper
        CacheHelper.saveData(key: "lastSeen", value: surahName);
        AzkarCubit.get(context).lastSeen=surahName;
        AzkarCubit.get(context).getQuraan(surahNumber: surahNumber);
        return BlocConsumer<AzkarCubit, AzkarState>(
          listener: (context, state) {
            // TODO: implement listener
          },

          builder: (context, state) {
            //conditional builder
            return ConditionalBuilder(
              condition: AzkarCubit.get(context).quraanModel != null&&state is SocialGetQuraanSuccessState,
              builder: (context) =>  Scaffold(

              appBar: AppBar(
              centerTitle: true,
              title: Row(
                children: [
                SizedBox(
                width: AppSize.s16,
              ),
                  Container(
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/WhatsApp Image 2022-09-23 at 9.01.26 PM.jpeg",
                          width: 35,
                          height: 35,
                        ),
                        Positioned(
                          top: 8,
                          right: 8.1,
                          child: Container(
                            width: 21,
                            height: 17,
                            //color: MyColors.kWhiteColor,
                            child: Center(
                              child: Text(
                                "${surahNumber}",
                                style: getBoldStyle(color: MyColors.kWhiteColor,
                                    fontSize: FontSizeManager.s12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Text(
                      surahName,
                      style: getBoldStyle(color: MyColors.kWhiteColor,
                          fontSize: FontSizeManager.s22)
                  ),
                ],
              ),
            ),
            //body of screen is list view contain all ayah
            body: ListView.builder(
            physics: const BouncingScrollPhysics(),
            shrinkWrap: true,
            itemCount: AzkarCubit.get(context).quraanModel!.data!.ayahs!.length,
            itemBuilder: (context, index) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //circle container contain image assets/images/WhatsApp Image 2022-09-23 at 9.00.51 PM.jpeg and text number of ayah
                  Container(
                    child: Stack(
                      children: [
                        Image.asset(
                          "assets/images/WhatsApp Image 2022-09-23 at 9.00.51 PM.jpeg",
                          width: 50,
                          height: 50,
                        ),
                        Positioned(
                          top: 13.9,
                          right: 17.1,
                          child: Container(
                            width: 21,
                            height: 17,
                          //  color: MyColors.kWhiteColor,
                            child: Center(
                              child: Text(
                                "${AzkarCubit.get(context).quraanModel!.data!.ayahs![index].numberInSurah}",
                                style: getBoldStyle(color: MyColors.starTextColor,
                                    fontSize: FontSizeManager.s12),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  Expanded(
                    flex: 13,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                           Text(
                          AzkarCubit.get(context).quraanModel!.data!.ayahs![index].text!,
                          style: getBoldStyle(color: MyColors.kWhiteColor,
                              fontSize: FontSizeManager.s18)
                        ),
                      ],
                    ),
                  ),
                ],
              );
            // return Container(
            // height: 60,
            // margin: const EdgeInsets.all(20),
            // decoration: BoxDecoration(
            // borderRadius: BorderRadius.circular(10),
            // color: MyColors.background,
            // boxShadow: [
            // BoxShadow(
            // color: Colors.grey.withOpacity(0.5),
            // spreadRadius: 5,
            // blurRadius: 7,
            // offset: const Offset(0, 3), // changes position of shadow
            // ),
            // ],
            // ),
            // child: Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            // children: [
            // const Icon(Icons.favorite_border,color: MyColors.kWhiteColor,),
            // Text(
            // "الاية رقم $index",
            // style: getBoldStyle(color: MyColors.textColor,
            // fontSize: FontSizeManager.s22),
            // ),
            // const Icon(Icons.favorite_border,color: MyColors.kWhiteColor,),
            // ],
            // ),
            // );
            },
            ),
            ),
              fallback: (context) => Center(
                child: CircularProgressIndicator(
                  color: MyColors.textColor,
                ),
              ),
            );

          },
        );

      },
    );
  }
}
