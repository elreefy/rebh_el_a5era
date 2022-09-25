import 'package:flutter/material.dart';
import 'package:rebh_el_a5era/business_logic/azkar_cubit/azkar_cubit.dart';
import 'package:rebh_el_a5era/shared/constants/my_colors.dart';
//import bloc consumer
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../shared/components/components.dart';
import '../../../shared/constants/strings.dart';

class AzkarScreen extends StatefulWidget {
  @override
  _HomeLayoutState createState() =>
      _HomeLayoutState();
}

class _HomeLayoutState
    extends State<AzkarScreen> {
  int currentValue = 0;

  @override
  Widget build(BuildContext context) {
 //  bool isPlaying=AzkarCubit.get(context).isPlaying;
    Size size = MediaQuery.of(context).size;
    double height = 50;
    return BlocConsumer<AzkarCubit, AzkarState>(
  listener: (context, state) {
    // TODO: implement listener
  },
  builder: (context, state) {
    return Scaffold(
      appBar: AppBar(
        leading: InkWell(
          onTap: () {
            AzkarCubit.get(context).getAllRadio();
          },
          child: Icon(
            Icons.list,
          ),
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
        ],
      ),
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