part of 'social_cubit.dart';

@immutable
abstract class SocialState {}

class SocialInitial extends SocialState {}
//SocialGetAzkarLoadingState
class SocialGetAzkarLoadingState extends SocialState {}
//SocialGetAzkarSuccessState
class SocialGetAzkarSuccessState extends SocialState {}
//SocialGetAzkarErrorState
class SocialGetAzkarErrorState extends SocialState {
  final String error;
  SocialGetAzkarErrorState(this.error);
}