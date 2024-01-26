import 'package:enigma/classes/logic/contdis/Page.dart' as lesson_page;
import 'package:enigma/modules/lesson_screen/cubit/lesson_screen_cubit.dart';
import 'package:enigma/modules/lesson_test_screen/cubit/lesson_test_cubit.dart';
import 'package:enigma/modules/lesson_test_screen/cubit/lesson_test_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../../shared/components/components.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key, required this.pages});

  final List<lesson_page.Page> pages;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonScreenCubit>(
        create: (context) => LessonScreenCubit(),
        child: BlocConsumer<LessonScreenCubit, LessonScreenState>(
          listener: (context, state) {},
          builder: (context, state) {
            LessonScreenCubit cubit = LessonScreenCubit.get(context);
            cubit.components = pages;
            cubit.numberOfPages = pages.length;

            return SafeArea(
              child: MediaQuery(
                data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
                child: Scaffold(
                  backgroundColor: const Color(0xffFFFFFF),
                  body: Padding(
                    padding: const EdgeInsets.only(
                      top: 16.0,
                      bottom: 16.0,
                    ),
                    child: Stack(
                      children: [
                        PageView.builder(
                          onPageChanged: cubit.onPageChanged,
                          controller: cubit.controller,
                          itemBuilder: (context, index) => GestureDetector(
                            onTap: () {
                              if (!cubit.isLast) {
                                if (cubit.sectionNumberToShow == 0) {
                                  cubit.controller.nextPage(
                                      duration: const Duration(milliseconds: 600),
                                      curve: Curves.linearToEaseOut);
                                  cubit.sectionNumberToShow = 0;
                                } else {
                                  cubit.showText(5);
                                }
                              }
                            },
                            child: BlocProvider<LessonTestCubit>(
                              create: (context) => LessonTestCubit(),
                              child:
                                  BlocConsumer<LessonTestCubit, LessonTestState>(
                                listener: (context, state) {},
                                builder: (context, state) {
                                  LessonTestCubit testCubit =
                                      LessonTestCubit.get(context);
                                  testCubit
                                      .prepareOrders(cubit.components!.length);
                                  return LessonScreenPage(
                                    cubit: cubit,
                                    page: cubit.components![index].getPage(
                                        testCubit, context, testCubit.randomI),
                                  );
                                },
                              ),
                            ),
                          ),
                          itemCount: pages.length,
                        ),
                        Container(
                          color: const Color(0xffFFFFFF),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                GestureDetector(
                                    onTap: ()=> openAnimatedDialog(context),
                                    child: SvgPicture.asset(
                                        'assets/images/illustration/exit.svg')),
                                SmoothPageIndicator(
                                  controller: cubit.controller,
                                  count: cubit.numberOfPages,
                                  effect: const ScrollingDotsEffect(
                                    dotHeight: 10,
                                    dotWidth: 32,
                                    dotColor: Color(0xffC7D3EB),
                                    activeDotColor: Color(0xff2196F3),
                                  ),
                                ),
                                const SizedBox(
                                  width: 24,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}

Widget sectionText(
        {required int index,
        required int shownText,
        required LessonTestCubit cubit}) =>
    AnimatedOpacity(
      opacity: (shownText >= index) ? 1 : 0,
      duration: const Duration(seconds: 1),
      child: const Column(
        children: [
          Text(
            'textaya[index]',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: -0.39,
            ),
          ),
          SizedBox(
            height: 8,
          ),
        ],
      ),
    );

class LessonScreenPage extends StatelessWidget {
  const LessonScreenPage({
    super.key,
    required this.cubit,
    required this.page,
  });

  final LessonScreenCubit cubit;
  final Widget page;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //cubit.components![1][1],
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/illustration/testillus.svg'),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          page
        ],
      ),
    );
  }
}

/*
Widget lessonScreen(
        {required LessonScreenCubit cubit, required lesson_page.Page page}) =>
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //cubit.components![1][1],
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/illustration/testillus.svg'),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          /*const Text(
            'مقدمة نحو لغة ++C:',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFF6600FF),
              fontSize: 16,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: -0.48,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'ماهي لغة ++C؟',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFFFF0000),
              fontSize: 14,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: -0.42,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
              children: List.generate(
                  textaya.length,
                  (index) => sectionText(
                      index: index, shownText: cubit.sectionNumberToShow))),*/
          page.getPage()
        ],
      ),
    );*/


