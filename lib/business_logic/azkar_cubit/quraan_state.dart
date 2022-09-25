part of 'quraan_cubit.dart';

@immutable
abstract class QuraanState {}

class QuraanInitial extends QuraanState {}
//QuraanPauseAudioState
class QuraanPauseAudioState extends QuraanState {}
//QuraanPlayAudioState
class QuraanPlayAudioState extends QuraanState {}
//QuraanlRadioPlayState
class QuraanlRadioPlayState extends QuraanState {}
//QuraanlRadioPauseState
class QuraanlRadioPauseState extends QuraanState {}
//SocialChangeBottomNavState
class SocialChangeBottomNavState extends QuraanState {}

