import 'package:enigma/modules/onboarding_screen/cubit/onboarding_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OnboardingCubit extends Cubit<OnboardingState> {
  OnboardingCubit() : super(OnboardingInitialState());

  PageController controller = PageController();
  bool isLast = false;

  onPageChanged(int index) {
    if (index == 2) {
      isLast = true;
      emit(OnboardingLastPageState());
    } else {
      isLast = false;
      emit(OnboardingLastPageState());
    }
  }
}
