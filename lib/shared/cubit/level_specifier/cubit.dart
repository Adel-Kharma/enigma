import 'package:enigma/screens/LevelSpecifierScreeen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'state.dart';

class LevelSpecifierCubit extends Cubit<LevelSpecifierState> {
  LevelSpecifierCubit() : super(LevelSpecifierInitial());

  static LevelSpecifierCubit get(context) => BlocProvider.of(context);

  final List<Widget> _contents = [const Section1(), const Section2()];

  int index = 0;

  late Widget content = _contents[index];

  void changeContent(int index) {
    this.index = index;
    content = _contents[index];
    emit(ChangeScreenState());
  }
}
