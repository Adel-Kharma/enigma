import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lesson_test_state.dart';

class LessonTestCubit extends Cubit<LessonTestState> {
  LessonTestCubit() : super(LessonTestInitialState()) {
    int l = Random().nextInt(4);
    int sectionToShow = 0;

    while (randomI.length != 4) {
      if (!randomI.contains(l)) {
        randomI.add(l);
      }
      l = Random().nextInt(4);
    }
  }

  static LessonTestCubit get(context) => BlocProvider.of(context);

  int chosenAnswer = 0;
  static int correctAnswers = 0;
  List<int> randomI = [];
  PageController pageController = PageController();

  void changeChosenAnswer(int index) {
    chosenAnswer = index;
    emit(LessonTestChooseAnswer());
  }
}
