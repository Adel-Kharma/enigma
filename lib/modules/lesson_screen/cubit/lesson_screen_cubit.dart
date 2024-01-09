import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:enigma/classes/logic/contdis/Page.dart' as lesson_page;

part 'lesson_screen_state.dart';

class LessonScreenCubit extends Cubit<LessonScreenState> {
  LessonScreenCubit() : super(LessonScreenInitialState());

  static LessonScreenCubit get(context) => BlocProvider.of(context);

  PageController controller = PageController();
  bool isLast = false;
  int sectionNumberToShow = 0;
  List<lesson_page.Page>? components;
  int totalCorrectAnswers = 0;
  int numberOfPages = 0;

  onPageChanged(int index) {
    if (index == numberOfPages - 1) {
      isLast = true;
      emit(LessonScreenLastPageState());
    } else {
      isLast = false;
      emit(LessonScreenPageChangedState());
    }
  }

  double opacityLevel = 0.0;

  void Function()? showText(int pageNumber) {
    sectionNumberToShow++;
    emit(LessonScreenShowText());
    return null;
  }
}
