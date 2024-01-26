import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'lesson_test_state.dart';

class LessonTestCubit extends Cubit<LessonTestState> {
  LessonTestCubit() : super(LessonTestInitialState()) {
    int l = Random().nextInt(4);

    while (randomI.length != 4) {
      if (!randomI.contains(l)) {
        randomI.add(l);
      }
      l = Random().nextInt(4);
    }
  }

  static LessonTestCubit get(context) => BlocProvider.of(context);

  List<int> chosenAnswer = [];
  List<int> correctAnswers = [];
  int countOfCorrect = 0;
  List<int> randomI = [];
  int qNum = 0;
  List<List<int>> randomTestAns = [];
  PageController pageController = PageController();
  int index = 0;
  bool revealAns = false;

  void changeChosenAnswer(int chosenIndex) {
    chosenAnswer[index] = chosenIndex;
    emit(LessonTestChooseAnswer());
  }

  void nextPage() {
    pageController.animateToPage(index + 1,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOutSine);
    index++;
    emit(PracticeNextPage());
  }

  void prevPage() {
    pageController.animateToPage(index - 1,
        duration: const Duration(milliseconds: 200), curve: Curves.easeOutSine);
    index--;
    emit(PracticePrevPage());
  }

  void revealAnswers() {
    revealAns = true;
    emit(RevealAns());
  }

  void countCorrect() {
    countOfCorrect++;
    emit(CountCorrect());
  }

  void prepareOrders(int qNum) {
    for (int i = 0; i < qNum; i++) {
      chosenAnswer.add(0);
      List<int> randO = [];
      int l = Random().nextInt(4);

      while (randO.length != 4) {
        if (!randO.contains(l)) {
          randO.add(l);
          if (l == 0) {
            correctAnswers.add(randO.length - 1);
          }
        }
        l = Random().nextInt(4);
      }

      randomTestAns.add(randO);
    }
  }
}
