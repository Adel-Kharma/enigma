import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'lesson_screen_state.dart';

class LessonScreenCubit extends Cubit<LessonScreenState> {
  LessonScreenCubit() : super(LessonScreenInitialState());

  static LessonScreenCubit get(context) => BlocProvider.of(context);

  PageController controller = PageController();
  bool isLast = false;
  int sectionNumberToShow = 0;
  List<List<Widget>>? components;
  int totalCorrectAnswers = 0;
  int? NumberOfQuestions;

  onPageChanged(int index) {
    if (index == 2) {
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
