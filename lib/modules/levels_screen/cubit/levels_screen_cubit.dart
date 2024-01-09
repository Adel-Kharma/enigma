import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../levels_screen.dart';

part 'levels_screen_state.dart';

class LevelsScreenCubit extends Cubit<LevelsScreenState> {
  LevelsScreenCubit() : super(LevelsScreenInitial());

  static LevelsScreenCubit get(context) => BlocProvider.of(context);

  int index = 0;

  final List<Widget> _contents = [Section1(), Section2(), Section3()];

  late Widget content = _contents[index];

  void changeContent(int index) {
    this.index = index;
    content = _contents[index];
    emit(ChangeScreenState());
  }
}
