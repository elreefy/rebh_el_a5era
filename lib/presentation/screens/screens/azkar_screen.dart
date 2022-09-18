// import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
//impot bloc package
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rebh_el_a5era/business_logic/news_cubit/social_cubit.dart';
import 'package:rebh_el_a5era/business_logic/news_cubit/social_cubit.dart';
//import ConditionalBuilder
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:rebh_el_a5era/shared/components/components.dart';
import '../../../data/models/Azkar_model.dart';

class AzkarScreen extends StatelessWidget {
  const AzkarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AzkarCubit, SocialState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        List<AzkarModel>? morningAzkarList=AzkarCubit.get(context).morningAzkarList;
        return Scaffold(
          body: ConditionalBuilder(
            builder: (BuildContext context) { return Center(
              child://list view contain all azkar
              Expanded(
                child: ListView.separated(
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(20),
                  itemBuilder: (context, index) {
                      return buildAzkarItem(
                          AzkarCubit
                              .get(context)
                              .morningAzkarList![index], context);
                  },
                  separatorBuilder: (context, index) => Container(
                    width: double.infinity,
                    height: 1,
                    color: Colors.grey[300],
                  ),
                  itemCount: AzkarCubit.get(context).morningAzkarList!.length,
                ),
              ),
            ); },
        fallback: (BuildContext context) { return Center(child: CircularProgressIndicator(),); },
            condition: AzkarCubit.get(context).morningAzkarList?.length != 0,
          ),
        );
      },
    );
  }

  buildAzkarItem(AzkarModel param0, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              '${param0.category}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
          Text(
            '${param0.description}',
            style: Theme.of(context).textTheme.bodyText1,
          ),
        ],
      ),
    );
  }
}
