part of 'azkar_cubit.dart';

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
//SocialRadioPlayState
class SocialRadioPlayState extends SocialState {}
//SocialRadioPauseState
class SocialRadioPauseState extends SocialState {}
//SocialAudioPlayState
class SocialAudioPlayState extends SocialState {}
//SocialAudioPauseState
//SocialChangeBottomNavState
class SocialChangeBottomNavState extends SocialState {}
