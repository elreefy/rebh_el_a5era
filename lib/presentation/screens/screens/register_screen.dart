// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mini_socia/layout/home_layout.dart';
//
// import '../../../business_logic/news_cubit/social_cubit.dart';
// import '../../../shared/components/components.dart';
//
// class RegisterScreen extends StatelessWidget {
//   var userNameController = TextEditingController();
//
//   var formKey = GlobalKey<FormState>();
//
//   var passwordRegisterController=TextEditingController();
//   //first name controller and last name controller
//   var firstNameController=TextEditingController();
//   var lastNameController=TextEditingController();
//
//    RegisterScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SocialCubit, SocialState>(
//   listener: (context, state)
//     {
//       if(state is SocialRegisterSuccessState){
//         showToast2(
//             msg: 'Register Success',
//             state: ToastStates.SUCCESS);
//         //navigate to home screen usimg navigator  .push named
//         Navigator.pushNamed(
//           context,
//           '/loginScreen',);
//     }
//   },
//   builder: (context, state) {
//     return Scaffold(
//       body: SafeArea(
//         child: Center(
//           //form contain columin contain text login and 2 deraulttext with validation field and button login and register
//           child: Form(
//             key: formKey,
//             child: SingleChildScrollView(
//               reverse: true,
//               physics: const BouncingScrollPhysics(),
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   const Text(
//                     'REGISTER',
//                     style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(
//                     height: 20.0,
//                   ),
//                   defaultFormField(
//                     controller: firstNameController,
//                    // type: TextInputType.emailAddress,
//                     validate: (String? value) {
//                       if (value!.length==0) {
//                         return 'please enter your email address';
//                       }
//                     },
//                     label: 'First Name',
//                      keyboardType:  TextInputType.name,
//                     prefixIcon: Icons.person,
//                   ),
//                   const SizedBox(
//                     height: 15.0,
//                   ),
//                      defaultFormField(
//                       controller: lastNameController,
//                       label: 'Last Name',
//                       keyboardType:  TextInputType.name,
//                       prefixIcon: Icons.person,
//                       ),
//                   SizedBox(
//                     height: 15.0,
//                   ),
//                   defaultFormField(
//                     controller: userNameController,
//                    // type: TextInputType.emailAddress,
//                     validate: (String? value) {
//                       if (value?.length ==0) {
//                         return 'please enter your email address';
//                       }
//                     },
//                     label: 'User Name',
//                     keyboardType: TextInputType.emailAddress,
//                     prefixIcon: Icons.email_outlined,
//                   ),
//                   const SizedBox(
//                     height: 15.0,
//                   ),
//                      defaultFormField(
//                       controller: passwordRegisterController,
//                       validate: ( value) {
//                         if (value?.length==0) {
//                           return 'password is toooo short';
//                         }
//                         else if(value!.length<6){
//                           return 'password is too short';
//                         }else
//                           return null;
//                       },
//                       label: 'Password',
//                       isPassword: SocialCubit.get(context).isPassword,
//                       suffixPressed: () {
//                         SocialCubit.get(context)
//                             .changePasswordVisibility();
//                       }, prefixIcon: Icons.lock_outline,
//                       keyboardType: TextInputType.visiblePassword,
//                       ),
//                   const SizedBox(
//                     height: 30.0,
//                   ),
//                   defaultButton(
//                     onTap: () {
//                       if (formKey.currentState!.validate()) {
//                         SocialCubit.get(context).userRegister(
//                             username: userNameController.text,
//                             password: passwordRegisterController.text,
//                             firstName: firstNameController.text,
//                             lastName: lastNameController.text);
//                       }
//           //            }
//                     }, text: 'register',
//                        ),
//                   //row of text if you have account and grey inkwell text login
//                   const SizedBox(
//                     height: 15.0,
//                   ),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       const Text(
//                         'if you have account ?',
//                         style: TextStyle(fontSize: 18.0),
//                       ),
//                       const SizedBox(
//                         width: 5.0,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           Navigator.pushNamed(                            context,
//                             '/loginScreen',
//                           );
//                         },
//                         child: const Text(
//                           'Login',
//                           style: TextStyle(
//                               fontSize: 18.0, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   },
// );
//   }
//
// }
