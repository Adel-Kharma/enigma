import 'package:flutter_bloc/flutter_bloc.dart';

import 'lesson_test_state.dart';

class LessonTestCubit extends Cubit<LessonTestState> {
  LessonTestCubit() : super(LessonTestInitialState());

  static LessonTestCubit get(context) => BlocProvider.of(context);

  int chosenAnswer = 0;
  static int correctAnswers = 0;

  void changeChosenAnswer(int index) {
    chosenAnswer = index;
    emit(LessonTestChooseAnswer());
  }
}
