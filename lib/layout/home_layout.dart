import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rebh_el_a5era/business_logic/azkar_cubit/azkar_cubit.dart';
import 'package:rebh_el_a5era/shared/constants/my_colors.dart';
//import bloc consumer
import 'package:flutter_bloc/flutter_bloc.dart';
import '../business_logic/azkar_cubit/quraan_cubit.dart';
import '../shared/components/components.dart';
import '../shared/constants/strings.dart';

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() =>
      _HomeLayoutState();
}

class _HomeLayoutState
    extends State<HomeLayout> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
 //  bool isPlaying=QuraanCubit.get(context).isPlaying;
    Size size = MediaQuery.of(context).size;
    double height = 50;
    return BlocConsumer<QuraanCubit, QuraanState>(
  listener: (context, state) {
   //if state is QuraanlRadioPlayState showToast2
    if (state is QuraanlRadioPlayState) {
      showToast2(
        msg: 'تم تشغيل تراتيل قصيرة',
        state: ToastStates.SUCCESS,
      );
    }else if(state is QuraanlRadioPauseState){
      // showToast2
      showToast2(
        msg: 'تم ايقاف تراتيل قصيرة',
        state: ToastStates.ERROR,
      );
    }

  },
  builder: (context, state) {
    return Scaffold(
      backgroundColor: MyColors.background,
    //  floatingActionButton: const Icon(
    //    Icons.play_arrow_outlined,
    //  ),
      bottomNavigationBar:Stack(
        children: [
          Container(
            height: 0.16*MediaQuery.of(context).size.height,
            width: double.infinity,
            //  color: MyColors.kWhiteColor,
          ),
          Padding(
            padding:EdgeInsets.only(
              top: 0.06*MediaQuery.of(context).size.height,

            ),
            child: Positioned(

              child: ClipPath(
                clipper: bottomNavClip(),
                child: BottomNavigationBar(
                  type: BottomNavigationBarType.fixed,
                  currentIndex: QuraanCubit.get(context).currentIndex,
                  onTap: (index) {
                    QuraanCubit.get(context).changeBottom(index);
                  },
                  items: [
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.receipt,
                        size: 30,
                      ),
                      label: AppStrings.azkar,
                    ),
                    BottomNavigationBarItem(
                      icon: Icon(
                        Icons.book,
                        size: 30,
                      ),
                      label: AppStrings.quran,
                    ),
                  ],
                ),
              ),
            ),
          ),
          //circle container with height 60 and width 60
          Positioned(
            bottom: 0.079*MediaQuery.of(context).size.height,
            left: 0.5*MediaQuery.of(context).size.width-30,
            child: InkWell(
              onTap: () {
                QuraanCubit.get(context).playRadio();
              },
              child: Container(

                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  color: MyColors.floatedButtonColor,
                  shape: BoxShape.circle,

                ),
                //if state is SocialRadioPlayState then show pause icon else show play icon
                child: QuraanCubit.get(context).isPlaying?
                Icon(Icons.pause,
                  size: 30,
                  color: MyColors.kWhiteColor,)
                    :Icon(Icons.play_arrow_outlined,
                  size: 30,
                  color: MyColors.kWhiteColor,),
              ),
            ),
          ),
        ],
      ),
      body: QuraanCubit.get(context).screens[QuraanCubit.get(context).currentIndex],
      );
  },
);
  }
}

class bottomNavClip extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    double w = size.width;
    double h = size.height;
    Path path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width*.35, 0);
    path.quadraticBezierTo(
        size.width *.5, size.height - 20, size.width*.65, 0);
   path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}