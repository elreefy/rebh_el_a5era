import 'package:flutter/material.dart';
import 'package:rebh_el_a5era/layout/home_layout.dart';
import 'package:rebh_el_a5era/presentation/screens/screens/evening_azkar.dart';
import 'package:rebh_el_a5era/presentation/screens/screens/morning_azkar.dart';
import 'package:rebh_el_a5era/presentation/screens/screens/sleep_azkar.dart';
import 'package:rebh_el_a5era/shared/constants/routes_manager.dart';
import 'package:rebh_el_a5era/shared/constants/strings.dart';

import 'presentation/screens/screens/zoom_drawer.dart';
class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
       case AppRoutes.mainRoute:
         return MaterialPageRoute(builder: (_) => Zoom());
         //case morning azkar route
        case AppRoutes.morningAzkar:
          return MaterialPageRoute(builder: (_) => MorningAzkar());
          //case evening azkar
        case AppRoutes.eveningAzkar:
          return MaterialPageRoute(builder: (_) => EveningAzkar());
          //case sleep azkar
        case AppRoutes.sleepAzkar:
          return MaterialPageRoute(builder: (_) => SleepAzkar());
      // case AppRoutes.azanRoute:
      //   return MaterialPageRoute(builder: (_) => const AzanView());
      // case AppRoutes.contantUsRoute:
      //   return MaterialPageRoute(builder: (_) => const ContantUsView());
      // case AppRoutes.azkarRoute:
      //   return MaterialPageRoute(builder: (_) => const AzkarView());
      // case AppRoutes.kibleRoute:
      //   return MaterialPageRoute(builder: (_) => const KibleView());
      // case AppRoutes.nawawiRoute:
      //   return MaterialPageRoute(builder: (_) => const NawawiView());
      //  case AppRoutes.quranRoute:
      //    return MaterialPageRoute(builder: (_) => const QuranView());
      //  case AppRoutes.radiosRoute:
      //    return MaterialPageRoute(builder: (_) => const RadiosView());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(AppStrings.noRoutes),
        ),
        body: const Center(
          child: Text(AppStrings.noRoutes),
        ),
      );
    });
  }
}
