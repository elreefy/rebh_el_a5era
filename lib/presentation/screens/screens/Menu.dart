import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:rebh_el_a5era/business_logic/azkar_cubit/azkar_cubit.dart';
import 'package:rebh_el_a5era/layout/home_layout.dart';
import 'package:rebh_el_a5era/shared/constants/app_size.dart';
import 'package:rebh_el_a5era/shared/constants/icon_broken.dart';
import 'package:rebh_el_a5era/shared/constants/my_colors.dart';
//import bloc consumer
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../business_logic/azkar_cubit/quraan_cubit.dart';
import '../../../shared/components/components.dart';
//import MenuScreen drawer
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../shared/constants/font_manager.dart';
import '../../../shared/constants/strings.dart';
import '../../../shared/constants/styles_manager.dart';



//menu items
List<MenuItem> menuItems = [
  MenuItem(
    id: 1,
    title: 'الرئيسية',
    icon: Icons.home,
  ),
  MenuItem(
    id: 2,
    title: 'الأذكار',
    icon: Icons.receipt,
  ),
  MenuItem(
    id: 3,
    title: 'القرآن',
    icon: Icons.book,
  ),
  MenuItem(
    id: 4,
    title: 'الأذكار المفضلة',
    icon: Icons.favorite,
  ),
  MenuItem(
    id: 5,
    title: 'الإعدادات',
    icon: Icons.settings,
  ),
  MenuItem(
    id: 6,
    title: 'تواصل معنا',
    icon: Icons.contact_mail,
  ),
];

class MenuItem {
  final int id;
  final String title;
  final IconData icon;

  MenuItem({required this.id, required this.title, required this.icon}) {
    // TODO: implement
    throw UnimplementedError();
  }
}
class MenuScreen extends StatefulWidget {
  @override
  _HomeLayoutState createState() =>
      _HomeLayoutState();
}

class _HomeLayoutState
    extends State<MenuScreen> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
 //  bool isPlaying=QuraanCubit.get(context).isPlaying;
    Size size = MediaQuery.of(context).size;
    double h = size.height;
    double w = size.width;
    return SafeArea(
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: h * .09,
            ),
           Container(
            // height: h*.1,
            //  width: w*.7,
             color: MyColors.background,
             child: Center(
               child: Text(
                 'معلومات عن التطبيق',
                 style:getBoldStyle(
                     color: MyColors.textColor,
                   fontSize: FontSizeManager.s22),
                 textAlign: TextAlign.center,
               ),
             ),

            ),
            //grey divider
            Container(
              height: h * .01,
              width: w * .7,
              color: MyColors.kGreyColor,
            ),
            SizedBox(height: h*.02,),
            //text
            Container(
              color: MyColors.background,
              child: Padding(
                padding:const EdgeInsets.only(right: AppSize.s14),
                child: Text(
                  'عن التطبيق :',
                  style: getRegularStyle(
                      color: MyColors.iconColor,
                      fontSize: FontSizeManager.s18),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SizedBox(height: h*.01,),
            Container(
              color: MyColors.background,
              child: Padding(
                padding: const EdgeInsets.only(right:AppSize.s14),
                child: Text(
                  'تطبيق مجانى و غير ربحي و يحتوى على اغلب ما يحتاجه المسلم من الأذكار و الأدعية',
                  style: getRegularStyle(
                      color: MyColors.kWhiteColor,
                      fontSize: FontSizeManager.s16),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
          SizedBox(height: h*.02,),
            //text
            Container(
              color: MyColors.background,
              child: Padding(
                padding: const EdgeInsets.only(right: AppSize.s14),
                child: Text(
                  'عن المطور :',
                  style: getRegularStyle(
                      color: MyColors.iconColor,
                      fontSize: FontSizeManager.s18),
                  textAlign: TextAlign.start,
                ),
              ),
            ),
            SizedBox(height: h*.01,),
            Container(
              color: MyColors.background,
              child: Padding(
                padding: const EdgeInsets.only(right:AppSize.s14),
                child: Text(
                  "تم التطوير بواسطة أحمد حسام ",
                  style: getRegularStyle(
                      color: MyColors.kWhiteColor,
                      fontSize: FontSizeManager.s16),
                      textAlign: TextAlign.start,
                ),
              ),
            ),
            SizedBox(height: h*.02,),
            //container cotain arrow icon in end of row and text in start of row
            Divider(
              color: MyColors.kGreyColor,
              thickness: 1,
            ),
            InkWell(
              onTap: () {
                launch('https://play.google.com/store/apps/details?id=com.road_map.newappname');
              },
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: AppSize.s10),
                child: Container(
                  color: MyColors.background,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: AppSize.s14),
                        child: Row(

                          children: [
                            Icon(
                              Icons.star,
                              color: MyColors.iconColor,
                              size: FontSizeManager.s18,
                            ),
                            SizedBox(
                              width: w * .01,
                            ),
                            Text(
                              'تقييم التطبيق',
                              style: getRegularStyle(
                                  color: MyColors.kWhiteColor,
                                  fontSize: FontSizeManager.s18),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: AppSize.s14),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: MyColors.iconColor,
                          size: FontSizeManager.s18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: MyColors.kGreyColor,
              thickness: 1,
            ),
            InkWell(
              onTap: (){
              //use url launcher to open link
                launch('https://www.linkedin.com/in/ahmed-el-reefy-1468711b9');

              },
              child: Padding(
                padding:  EdgeInsets.symmetric(vertical: AppSize.s10),
                child: Container(
                  color: MyColors.background,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: AppSize.s14),
                        child: Row(

                          children: [
                            Icon(
                              Icons.corporate_fare,
                              color: MyColors.iconColor,
                              size: FontSizeManager.s18,
                            ),
                            SizedBox(
                              width: w * .01,
                            ),
                            Text(
                              'لينكد ان',
                              style: getRegularStyle(
                                  color: MyColors.kWhiteColor,
                                  fontSize: FontSizeManager.s18),
                              textAlign: TextAlign.start,
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: AppSize.s14),
                        child: Icon(
                          Icons.arrow_forward_ios,
                          color: MyColors.iconColor,
                          size: FontSizeManager.s18,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Divider(
              color: MyColors.kGreyColor,
              thickness: 1,
            ),





          ],
        ),
      ),
    );
  }
}

