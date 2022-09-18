// // import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:mini_socia/business_logic/news_cubit/social_cubit.dart';
//
// import '../../../shared/components/components.dart';
//
// class CreatePostScreen extends StatelessWidget {
//   const CreatePostScreen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocConsumer<SocialCubit, SocialState>(
//   listener: (context, state) {
//     // TODO: implement listener
//   },
//   builder: (context, state) {
//     return Scaffold(
//     body: Column(
//       children: [
//         //form contain columin contain 3 deraulttext with validation field and button create
//         Form(
//           child: SingleChildScrollView(
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.end,
//               children: [
//                 const Text(
//                   'Create Post',
//                   style: TextStyle(fontSize: 35.0, fontWeight: FontWeight.bold),
//                 ),
//                 const SizedBox(
//                   height: 20.0,
//                 ),
//                 defaultFormField(
//                   controller: SocialCubit.get(context).postController,
//                   validate: (String? value) {
//                     if (value?.length==0) {
//                       return 'please enter your post';
//                     }
//                   },
//                   label: 'Post',
//                   keyboardType: TextInputType.text,
//                   prefixIcon: Icons.post_add_outlined,
//                 ),
//                 const SizedBox(
//                   height: 15.0,
//                 ),
//                 defaultFormField(
//                   controller: SocialCubit.get(context).imageController,
//                   // validate: (String? value) {
//                   //   if (value?.length==0) {
//                   //     return 'please enter p';
//                   //   }
//                   // },
//                   label:' postimage',
//                   prefixIcon: Icons.image,
//                 ),
//                 const SizedBox(
//                   height: 15.0,
//                 ),
//                 defaultFormField(
//                   controller: SocialCubit.get(context).profileImageController,
//                   // validate: (String? value) {
//                   //   if (value?.length==0) {
//                   //     return 'please enter your post';
//                   //   }
//                   // },
//                   label: 'profile Image',
//               //    keyboardType: TextInputType.text,
//                   prefixIcon: Icons.image,
//                 ),
//                 const SizedBox(
//                   height: 15.0,
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: Container(
//                     width: double.infinity,
//                     height: 40.0,
//                     color: Colors.blue,
//                     child: MaterialButton(
//                       onPressed: () {
//                         SocialCubit.get(context).createPost(text:
//                         SocialCubit.get(context).postController.text
//                         ,postImage:SocialCubit.get(context).imageController.text
//                         ,profileImage: SocialCubit.get(context).profileImageController.text
//                         ).whenComplete(() {
//                           SocialCubit.get(context).postController.clear();
//                           SocialCubit.get(context).imageController.clear();
//                           SocialCubit.get(context).profileImageController.clear();
//                           SocialCubit.get(context).getAllPost();
//                           Navigator.pop(context);
//                         });
//                       },
//                       child: const Text(
//                         'POST',
//                         style: TextStyle(color: Colors.white),
//                       ),
//                     ),
//                   ),
//                 ),
//
//               ],
//             ),
//           ),
//         ),
//       ],
//     )
//     );
//   },
// );
//   }
// }
