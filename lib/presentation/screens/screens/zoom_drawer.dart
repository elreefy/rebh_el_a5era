import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_zoom_drawer/config.dart';
import 'package:rebh_el_a5era/business_logic/azkar_cubit/azkar_cubit.dart';
import 'package:rebh_el_a5era/layout/home_layout.dart';
import 'package:rebh_el_a5era/shared/constants/my_colors.dart';
//import bloc consumer
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../business_logic/azkar_cubit/quraan_cubit.dart';
import '../../../shared/components/components.dart';
//import zoom drawer
import 'package:flutter_zoom_drawer/flutter_zoom_drawer.dart';
import '../../../shared/constants/strings.dart';
import 'Menu.dart';

class Zoom extends StatefulWidget {
  @override
  _HomeLayoutState createState() =>
      _HomeLayoutState();
}

class _HomeLayoutState
    extends State<Zoom> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double height = 50;
    return BlocConsumer<QuraanCubit, QuraanState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return  //ZoomDrawer
    ZoomDrawer(
      mainScreenScale: .4,
      menuBackgroundColor: MyColors.background,
      style: DrawerStyle.defaultStyle,
      isRtl: true,
     angle:0 ,
     // style: DrawerStyle.Style1,
      menuScreen: MenuScreen(),
      mainScreen: HomeLayout(),
    );
  },
);
  }
}
