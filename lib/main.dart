import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebh_el_a5era/presentation/screens/screens/azkar_screen.dart';
import 'business_logic/cubit/cubit_observer.dart';
import 'business_logic/news_cubit/social_cubit.dart';
import 'data/api/init_get_it.dart';
import 'data/cashe_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'routiong.dart';
import 'package:bot_toast/bot_toast.dart';

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

        ),
      ],
      child: MaterialApp(
       // onGenerateRoute: RouteGenerator.generateRoute,
       // initialRoute: intialRoute,
        debugShowCheckedModeBanner: false,
        builder: BotToastInit(), //1. call BotToastInit
        navigatorObservers: [BotToastNavigatorObserver()],
        title: 'Flutter Demo',
        theme: ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar.Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or simply save your changes to "hot reload" in a Flutter IDE).
          // Notice that the counter didn't reset back to zero; the application
          // is not restarted.
          primarySwatch: Colors.blue,
        ),
        home: const AzkarScreen(),
      ),
    );
  }
}
