import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../educational_screens.dart';

part 'educational_screens_state.dart';

class EducationalScreensCubit extends Cubit<EducationalScreensState> {
  EducationalScreensCubit() : super(LevelsScreenInitial());

  static EducationalScreensCubit get(context) => BlocProvider.of(context);

  int index = 0;

  final List<Widget> _contents = [
    const LevelsSection(),
    const ProgressSection(),
    const DoneSection()
  ];

  late Widget content = _contents[index];

  void changeContent(int index) {
    this.index = index;
    content = _contents[index];
    emit(ChangeScreenState());
  }
}
