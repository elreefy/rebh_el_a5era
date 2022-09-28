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
import 'package:share_plus/share_plus.dart';
import '../../../business_logic/azkar_cubit/azkar_cubit.dart';
import '../../../data/models/Azkar_model.dart';
import 'package:clipboard/clipboard.dart';

import '../../../shared/constants/font_manager.dart';
import '../../../shared/constants/styles_manager.dart';
class EveningAzkar extends StatelessWidget {
  const EveningAzkar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //height of screen
    double height = MediaQuery.of(context).size.height;
    //width of screen
    double width = MediaQuery.of(context).size.width;
    return BlocConsumer<AzkarCubit, AzkarState>(
      listener: (context, state) {
//if state is  EveningAzkarPauseAudioState showToast2 elseif EveningAzkarPauseAudioState showToast2
if(state is EveningAzkarPauseAudioState){
        showToast2(msg: "تم إيقاف الصوت", state: ToastStates.ERROR);
      }else if(state is EveningAzkarPlayAudioState){
        showToast2(msg: "تم تشغيل الصوت",state: ToastStates.SUCCESS);
      }
      },
      builder: (context, state) {
        List<AzkarModel>? eveningAzkarList=AzkarCubit.get(context).eveningAzkarList;
        return Scaffold(
          appBar:AppBar(
            actions: [
              InkWell(
                onTap: () {
                  AzkarCubit.get(context).playEveningAudio();
                },
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 10,

                      top: 10,
                      bottom: 10),

                  child: Container(

                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      color: MyColors.floatedButtonColor,
                      shape: BoxShape.circle,

                    ),
                    //if state is SocialRadioPlayState then show pause icon else show play icon
                    child: AzkarCubit.get(context).isPlayingEveningAudio?
                    Icon(Icons.pause,
                      size: 30,
                      color: MyColors.kWhiteColor,)
                        :Icon(Icons.play_arrow_outlined,
                      size: 30,
                      color: MyColors.kWhiteColor,),

                    // child:  Icon(
                    //   AzkarCubit.get(context).icon,
                    //   size: 30,
                    //   color: MyColors.kWhiteColor,
                    // ),
                  ),
                ),
              ),
            ],
            centerTitle: true,
            backgroundColor: MyColors.background,
            title: Text(
              "أذكار المساء",
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
                              .eveningAzkarList![index], context,index
                      );
                  },
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  itemCount: AzkarCubit.get(context).eveningAzkarList!.length,
                ),
              ),
            ); },
        fallback: (BuildContext context) { return Center(child: CircularProgressIndicator(),); },
            condition: AzkarCubit.get(context).eveningAzkarList?.length != 0,
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
                  //share zekr.zekr using share_plus package
                  Share.share(zekr.zekr!);
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
