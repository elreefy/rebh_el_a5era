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

import '../../../shared/constants/font_manager.dart';
import '../../../shared/constants/styles_manager.dart';
class AzkarScreen extends StatelessWidget {
  const AzkarScreen({Key? key}) : super(key: key);

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
        List<AzkarModel>? morningAzkarList=AzkarCubit.get(context).morningAzkarList;
        return Scaffold(
          appBar:AppBar(
            centerTitle: true,
            backgroundColor: MyColors.background,
            title: Text(
              "أذكار الصباح",
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
                              .morningAzkarList![index], context,index
                      );
                  },
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  itemCount: AzkarCubit.get(context).morningAzkarList!.length,
                ),
              ),
            ); },
        fallback: (BuildContext context) { return Center(child: CircularProgressIndicator(),); },
            condition: AzkarCubit.get(context).morningAzkarList?.length != 0,
          ),
        );
      },
    );
  }

  buildAzkarItem(AzkarModel zekr, BuildContext context, int index) {
    return Padding(
      padding: EdgeInsets.all(
        AppPadding.p1
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
         //row of two icon broken heart and share
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              //square container contain index +1 with border color white
              Container(
                padding: EdgeInsets.all(AppPadding.p4),
                decoration: BoxDecoration(
                  border: Border.all(color: MyColors.textColor),
                  borderRadius: BorderRadius.circular(AppSize.s10),
                ),
                child: Text(
                  '${index + 1}',
                  style: TextStyle(color: Colors.white),
                ),
              ),
              SizedBox(
                width: AppSize.s14,
              ),

              Container(
               width: MediaQuery.of(context).size.width*.5,
               height:  MediaQuery.of(context).size.height*.04,
                padding: EdgeInsets.symmetric(
                  horizontal: AppPadding.p4,
                  vertical: AppPadding.p1,
                ),
                decoration: BoxDecoration(
                  color: MyColors.containerTextColor,
                  borderRadius: BorderRadius.circular(
                    AppSize.s10
                  )
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('عدد المرات :',style: TextStyle(color: Colors.white),),
                    Text('${zekr.count}',style: TextStyle(color: MyColors.iconColor),),
                  ],
                ),
              ),
         //     SizedBox(
         //       width: AppSize.s10,
         //     ),

              //icon of broken heart
              IconButton(
                onPressed: () {
                  //copy zekr.zekr to clipboard
                  FlutterClipboard.copy(zekr.zekr!).then((value) =>
                      ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(content: Text('تم النسخ'))));
                },
                icon:  Icon(
                  Icons.copy,
                  color: MyColors.iconColor,

                ),
              ),
              //icon of share
              IconButton(
                onPressed: () {
                  //share zekr.zekr  text with whats up or messanger



                },
                icon: Icon(
                  Icons.share,
                  color: MyColors.iconColor,
                ),
              ),
            ],
          ),
          Text(
              '${zekr.zekr}',
            style: getMediumStyle(color: MyColors.kWhiteColor,
              fontSize: FontSizeManager.s18
            ),
          ),
        ],
      ),
    );
  }
}
