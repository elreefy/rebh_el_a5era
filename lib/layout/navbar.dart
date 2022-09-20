import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rebh_el_a5era/shared/constants/my_colors.dart';

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
    Size size = MediaQuery.of(context).size;
    double height = 50;
    return Scaffold(
    //  floatingActionButton: const Icon(
    //    Icons.play_arrow_outlined,
    //  ),
    //  bottomNavigationBar:
      appBar: AppBar(
        leading: const Icon(
          Icons.list,
        ),
        title: Text(
          AppStrings.azkar,
        ),
        elevation: 0,
      ),
      body:Column(
        children: [
          //container with height 200 and width width of screen *.8 contain asset image
          SizedBox(
            height: 0.02*MediaQuery.of(context).size.height,
          ),
          azkarContainer(
            context: context,
            image: 'assets/images/WhatsApp Image 2022-09-20 at 5.22.10 PM.jpeg',
          route: '/morningAzkar',
          ),
          SizedBox(
            height: 0.02*MediaQuery.of(context).size.height,
          ),
          azkarContainer(
            context: context,
            image: 'assets/images/WhatsApp Image 2022-09-20 at 5.22.33 PM.jpeg',
          route: '/eveningAzkar',
          ),

          SizedBox(
            height: 0.02*MediaQuery.of(context).size.height,
          ),
          azkarContainer(
            context: context,
            image: 'assets/images/WhatsApp Image 2022-09-20 at 5.23.03 PM.jpeg',
          route: '/sleepAzkar',
          ),
          SizedBox(
            height: 0.02*MediaQuery.of(context).size.height,
          ),
          azkarContainer(
            context: context,
            image: 'assets/images/WhatsApp Image 2022-09-20 at 5.23.03 PM.jpeg',
          ),
          SizedBox(
            height: 0.02*MediaQuery.of(context).size.height,
          ),
          azkarContainer(
            context: context,
            image: 'assets/images/WhatsApp Image 2022-09-20 at 5.23.03 PM.jpeg',
          ),
          SizedBox(
            height: 0.02*MediaQuery.of(context).size.height,
          ),
          azkarContainer(
            context: context,
            image: 'assets/images/WhatsApp Image 2022-09-20 at 5.23.03 PM.jpeg',
          ),
          Spacer(),
          Stack(
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
                      currentIndex: 0,
                      onTap: (index) {},
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
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: MyColors.floatedButtonColor,
                    shape: BoxShape.circle,

                  ),
                  child: const Icon(
                    Icons.play_arrow_rounded,
                    size: 30,
                    color: MyColors.kWhiteColor,
                  ),
                ),
              ),

            ],
          ),
        ],
      ),
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