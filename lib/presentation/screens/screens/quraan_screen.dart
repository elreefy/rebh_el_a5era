// import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//impot bloc package
import 'package:flutter_bloc/flutter_bloc.dart';
//import ConditionalBuilder
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:rebh_el_a5era/shared/components/components.dart';
import 'package:rebh_el_a5era/shared/constants/app_size.dart';
import 'package:rebh_el_a5era/shared/constants/my_colors.dart';
import '../../../business_logic/azkar_cubit/azkar_cubit.dart';
import '../../../data/models/Azkar_model.dart';
import 'package:clipboard/clipboard.dart';

import '../../../data/models/SurahModel.dart';
import '../../../shared/constants/font_manager.dart';
import '../../../shared/constants/strings.dart';
import '../../../shared/constants/styles_manager.dart';
class QuraanScreen extends StatelessWidget {
  const QuraanScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //height of screen
    double height = MediaQuery.of(context).size.height;
    //width of screen
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AzkarCubit, SocialState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        List<AzkarModel>? eveningAzkarList=AzkarCubit.get(context).eveningAzkarList;
        return Scaffold(
          appBar:AppBar(
            centerTitle: true,
            backgroundColor: MyColors.background,
            title: Text(
              AppStrings.quran,
            style: getBoldStyle(color: MyColors.textColor,
            fontSize: FontSizeManager.s22)

            ),
          ),
          backgroundColor: MyColors.background,
          body: ConditionalBuilder(
            builder: (BuildContext context) { return Center(
              child://list view contain all azkar
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (context, index) {
                      return buildAzkarItem(
                               AzkarCubit
                              .get(context)
                              .surahModel!.data![index],
                               context,
                               index
                      );
                  },
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[700],
                  ),
                  itemCount: AzkarCubit.get(context).surahModel!.data!.length,
                ),
              ),
            ); },
        fallback: (BuildContext context) { return Center(child: CircularProgressIndicator(),); },
            condition: AzkarCubit.get(context).surahModel?.data?.length != 0,
          ),
        );
      },
    );
  }

  buildAzkarItem(Data surah, BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.all(
        AppPadding.p8
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Column(
                children: [
                  Text(
                      '${surah.name}',
                    style: getMediumStyle(color: MyColors.kWhiteColor,
                      fontSize: FontSizeManager.s16
                    ),
                  ),
                  SizedBox(
                    height: AppSize.s1,
                  ),
                  //if surah.revelationType is meccan show text'مكية' else show text 'مدنية'
                   Text(
                    surah.revelationType == 'Meccan'
                        ? 'مكية '+"("+'عدد آياتها: '+ (surah.numberOfAyahs).toString()+")"
                        : 'مدنية '+"("+'عدد آياتها: '+ (surah.numberOfAyahs).toString()+")",
                    style: getMediumStyle(color: MyColors.kWhiteColor,
                        fontSize: FontSizeManager.s12
                    ),
                  ),
                 ]
              ),
              Spacer(),
              //text of surah english name
              Text(
                surah.englishName!,
                style: getMediumStyle(color: MyColors.textColor,
                    fontSize: FontSizeManager.s18
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
