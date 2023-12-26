import 'package:enigma/modules/onboarding_screen/cubit/onboarding_cubit.dart';
import 'package:enigma/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'cubit/onboarding_states.dart';

bool lastPageFlag = false;

class OnboardingScreen extends StatelessWidget {
  const OnboardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<OnboardingCubit>(
      create: (context) => OnboardingCubit(),
      child: BlocConsumer<OnboardingCubit, OnboardingStates>(
        listener: (context, state) {},
        builder: (context, state) {
          OnboardingCubit cubit = BlocProvider.of(context);
          return Scaffold(
            body: Stack(
              children: [
                PageView.builder(
                  physics: const BouncingScrollPhysics(),
                  onPageChanged: cubit.onPageChanged,
                  controller: cubit.controller,
                  itemBuilder: (context, index) {
                    return SizedBox(
                        child: onboardingContent(context, index: index));
                  },
                  itemCount: 3,
                ),
                Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SmoothPageIndicator(
                        effect: const ExpandingDotsEffect(
                          activeDotColor: Color(0xff0961F5),
                          dotColor: Color(0xffE0E0E0),
                        ),
                        controller: cubit.controller,
                        count: 3,
                      ),
                      const SizedBox(
                        height: 100,
                      )
                    ],
                  ),
                ),
                Positioned(
                  left: 10,
                  top: 30,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                      foregroundColor: const Color(0xFFF9F9F9),
                    ),
                    child: const Text(
                      'تخطي',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 13,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        decorationColor: Color(0xFFF9F9F9),
                        height: 0,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    left: 20,
                    bottom: 20,
                    child: (!lastPageFlag)
                        ? RotatedBox(
                            quarterTurns: 2,
                            child: FloatingActionButton(
                              onPressed: () {
                                if (!cubit.isLast) {
                                  cubit.controller.nextPage(
                                      duration:
                                          const Duration(milliseconds: 600),
                                      curve: Curves.linearToEaseOut);
                                } else {
                                  // Navigator.of(context).pushReplacement(
                                  //   MaterialPageRoute(
                                  //     builder: (context) => const LoginScreen(),
                                  //     // !here put cache
                                  //   ),
                                  // );
                                }
                              },
                              // splashColor: whiteColor.withOpacity(.2),
                              // hoverColor: whiteColor.withOpacity(.2),
                              // focusColor: whiteColor.withOpacity(.2),
                              backgroundColor: const Color(0xFF0961F5),
                              shape: const CircleBorder(),
                              child: const Icon(
                                Icons.arrow_back,
                                color: Color(0xffffffff),
                              ),
                            ),
                          )
                        : ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF0961F5),
                            ),
                            onPressed: () {},
                            child: const Text(
                              'انطلق الآن',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFF9F9F9),
                                fontSize: 13,
                                fontFamily: 'Cairo',
                                fontWeight: FontWeight.w700,
                                height: 0,
                              ),
                            ))),
              ],
            ),
          );
        },
      ),
    );
  }
}
