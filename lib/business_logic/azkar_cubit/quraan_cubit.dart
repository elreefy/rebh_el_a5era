import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
//import bloc provider
import 'package:flutter_bloc/flutter_bloc.dart';
//IMPORT AUDIO PLAYER
import 'package:audioplayers/audioplayers.dart';

import '../../presentation/screens/screens/azkar_screen.dart';
import '../../presentation/screens/screens/quraan_screen.dart';
import '../../shared/constants/strings.dart';
part 'quraan_state.dart';


class QuraanCubit extends Cubit<QuraanState> {
  QuraanCubit() : super(QuraanInitial());
  static QuraanCubit get(context) => BlocProvider.of(context);
  AudioPlayer audioPlayer = AudioPlayer();
  bool isPlaying = false;
  IconData icon = Icons.play_arrow_rounded;
//TODO: play radio dh moheeeeeeeeeeeeeeeeeeeeeeeeeeeem
void playRadio() {
  if (isPlaying) {
    audioPlayer.pause();
    isPlaying = false;
    icon = Icons.play_arrow_rounded;
    emit(QuraanlRadioPauseState());
  } else {
    audioPlayer.play(tarateelUrl);
    isPlaying = true;
    icon = Icons.pause;
    emit(QuraanlRadioPlayState());
  }
   }
  int currentIndex = 0;
  List<Widget> screens = [
    AzkarScreen(),
    QuraanScreen(),
    // SurahScreen(),
    // ProfileScreen(),
  ];
  List<String> titles = [
    'أذكار',
    'القرآن الكريم',
  ];
  //change bottom navigation bar index
  void changeBottom(int index) {
    currentIndex = index;
    emit(SocialChangeBottomNavState());
  }


}
