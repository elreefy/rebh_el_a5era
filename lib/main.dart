import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebh_el_a5era/presentation/screens/screens/evening_azkar.dart';
import 'package:rebh_el_a5era/presentation/screens/screens/morning_azkar.dart';
import 'package:rebh_el_a5era/presentation/screens/screens/sleep_azkar.dart';
import 'package:rebh_el_a5era/shared/constants/routes_manager.dart';
import 'package:rebh_el_a5era/shared/constants/theme_manager.dart';
import 'business_logic/azkar_cubit/azkar_cubit.dart';
import 'business_logic/cubit/cubit_observer.dart';
import 'data/api/init_get_it.dart';
import 'data/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'layout/home_layout.dart';
import 'routiong.dart';
import 'package:bot_toast/bot_toast.dart';
import 'package:flutter_localizations/flutter_localizations.dart';



Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheHelper.init();
  //init get it
  initGetIt();

  //firebase messaage grt token and save it in tooken variable
  await CacheHelper.init();
  BlocOverrides.runZoned(() => runApp(const MyApp())
      ,blocObserver: MyBlocObserver()
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => getIt<AzkarCubit>()
          ..getMorningAzkar()
          ..getEveningAzkar()
          ..getSleepAzkar()
            ..getAllSurah()
    //      ..getAllRadio()
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,

        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('ar', "AE"),
        ],

        builder: BotToastInit(),
        navigatorObservers: [BotToastNavigatorObserver()],
        //debugShowCheckedModeBanner: false,
       // home:  HomeLayout(),
          initialRoute: AppRoutes.mainRoute,
        onGenerateRoute:RouteGenerator.generateRoute,
        title: 'Flutter Demo',
        theme: getApplicationTheme(),
      //  home: const AzkarScreen(),
      ),
    );
  }
}
