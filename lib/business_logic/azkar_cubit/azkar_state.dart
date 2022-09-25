part of 'azkar_cubit.dart';

@immutable
abstract class AzkarState {}
//QuraanPauseAudioState
class AzkarPauseAudioState extends AzkarState {}
//QuraanPlayAudioState
class AzkarPlayAudioState extends AzkarState {}
class SocialInitial extends AzkarState {}
//SocialGetAzkarLoadingState
class SocialGetAzkarLoadingState extends AzkarState {}
//SocialGetAzkarSuccessState
class SocialGetAzkarSuccessState extends AzkarState {}
//SocialGetAzkarErrorState
class SocialGetAzkarErrorState extends AzkarState {
  final String error;
  SocialGetAzkarErrorState(this.error);
}
//SocialRadioPlayState
class SocialRadioPlayState extends AzkarState {}
//SocialRadioPauseState
class SocialRadioPauseState extends AzkarState {}
//SocialAudioPlayState
class SocialAudioPlayState extends AzkarState {}
//SocialAudioPauseState
//SocialChangeBottomNavState
class SocialChangeBottomNavState extends AzkarState {}
//SocialGetQuraanLoadingState
class SocialGetQuraanLoadingState extends AzkarState {}
//SocialGetQuraanSuccessState
class SocialGetQuraanSuccessState extends AzkarState {}
//SocialGetQuraanErrorState
class SocialGetQuraanErrorState extends AzkarState {
  final String error;
  SocialGetQuraanErrorState(this.error);
}