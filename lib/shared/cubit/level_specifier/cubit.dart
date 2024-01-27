import 'package:enigma/classes/logic/contdis/LessonReader.dart';
import 'package:enigma/screens/LevelSpecifierScreeen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class LevelSpecifierCubit extends Cubit<LevelSpecifierState> {
  final List<Widget> _contents = [];

  LevelSpecifierCubit(List<Widget> widgets, List<LessonReader> lessons)
      : super(LevelSpecifierInitial()) {
    //todo set logic or on the lessons
    _contents.add(Section1(
      widgets: widgets,
    )); //todo لازم يا حباب تعطي الدروس من هون
    _contents.add(Section2(
      testContents: lessons,
    ));
  }

  List<Widget> widgets = [];

  static LevelSpecifierCubit get(context) => BlocProvider.of(context);

  int index = 0;

  late Widget content = _contents[index];

  void changeContent(int index) {
    this.index = index;
    content = _contents[index];
    emit(ChangeScreenState());
  }
}
