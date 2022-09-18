// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mini_socia/business_logic/news_cubit/social_cubit.dart';
// import 'package:mini_socia/presentation/screens/screens/create_post.dart';
// import 'package:mini_socia/presentation/screens/screens/login_screen.dart';
// import 'package:mini_socia/presentation/screens/screens/register_screen.dart';
// import 'package:mini_socia/shared/constants/strings.dart';
//
// import 'data/api/init_get_it.dart';
// import 'layout/home_layout.dart';
//
// //import home screen
// class RouteGenerator {
//   static Route<dynamic> generateRoute(RouteSettings settings) {
//     // Getting arguments passed in while calling Navigator.pushNamed
//     final args = settings.arguments;
//
//     switch (settings.name) {
//       case homeScreen:
//       //  final SocialMediaUser args = settings.arguments as SocialMediaUser;
//         return MaterialPageRoute(builder: (_) =>
//             BlocProvider(
//               create: (context) => getIt<SocialCubit>(),
//               child: HomeScreen(
//                 //      userModel: args,
//               ),
//             ));
//     //case loginScreen
//       case loginScreen:
//         return MaterialPageRoute(builder: (_) => LoginScreen());
//       case registerScreen:
//         return MaterialPageRoute(builder: (_) => RegisterScreen());
//   case createPostScreen:
//         return MaterialPageRoute(builder: (_) => CreatePostScreen());
//
//       default:
//         return _errorRoute();
//     }
//   }
//
//   static Route<dynamic> _errorOtp() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('otp'),
//         ),
//         body: Center(
//           child: Text('otp'),
//         ),
//       );
//     });
//   }
//
//   static Route<dynamic> _errorRoute() {
//     return MaterialPageRoute(builder: (_) {
//       return Scaffold(
//         appBar: AppBar(
//           title: Text('Error'),
//         ),
//         body: Center(
//           child: Text('ERROR'),
//         ),
//       );
//     });
//   }
// }