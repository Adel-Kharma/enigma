import 'package:enigma/classes/logic/contdis/Practice.dart';
import 'package:enigma/modules/lesson_test_screen/cubit/lesson_test_cubit.dart';
import 'package:enigma/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../NumBackground.dart';
import 'cubit/lesson_test_state.dart';

class LessonTestScreen extends StatelessWidget {
  const LessonTestScreen({super.key, required this.practices});

  final List<Practice> practices;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonTestCubit>(
      create: (context) => LessonTestCubit(),
      child: BlocConsumer<LessonTestCubit, LessonTestState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LessonTestCubit.get(context);
          cubit.prepareOrders(practices.length);
          return Scaffold(
            body: NumBackground(
              child: Stack(
                children: [
                  Positioned(
                    bottom: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height / 2,
                      width: MediaQuery.of(context).size.width,
                      color: const Color(0xFFF9F9F9),
                      child: const Center(
                        child: Text(''),
                      ),
                    ),
                  ),
                  PageView.builder(
                    itemCount: practices.length,
                    physics: const NeverScrollableScrollPhysics(),
                    controller: cubit.pageController,
                    itemBuilder: (_, index) => SingleChildScrollView(
                      child: Stack(children: [
                        Column(
                          children: [
                            const SizedBox(
                              height: 144,
                            ),
                            const SizedBox(
                              height: 150,
                            ),
                            Container(
                              width: double.infinity,
                              decoration: const ShapeDecoration(
                                color: Color(0xFFF9F9F9),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(16),
                                    topRight: Radius.circular(16),
                                  ),
                                ),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(
                                      height: 70,
                                    ),
                                    practices[index].getPage(
                                        cubit,
                                        cubit.randomTestAns[index],
                                        index + 1,
                                        index,
                                        context),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Opacity(
                                          opacity: (cubit.index > 0) ? 1 : 0,
                                          child: ElevatedButton(
                                            onPressed: () {
                                              if (cubit.index <= 0) {
                                                cubit.index = 0;
                                              } else {
                                                cubit.prevPage();
                                              }
                                            },
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: const Size(0, 40),
                                              backgroundColor:
                                                  const Color(0xff181C71),
                                            ),
                                            child: const Text(
                                              'السؤال السابق',
                                              style: TextStyle(
                                                color: Color(0xFFF9F9F9),
                                                fontSize: 13,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                              ),
                                            ),
                                          ),
                                        ),
                                        ElevatedButton(
                                          onPressed: () {
                                            if (cubit.index >=
                                                practices.length - 1) {
                                              cubit.index =
                                                  practices.length - 1;
                                              cubit.countOfCorrect = 0;
                                              int coc = 0;
                                              for (int j = 0;
                                                  j < cubit.chosenAnswer.length;
                                                  j++) {
                                                if (cubit.chosenAnswer[j] == 1)
                                                  coc++;
                                              }
                                              cubit.revealAnswers();
                                              Navigator.push(context,
                                                  MaterialPageRoute(
                                                      builder: (_) {
                                                return const SafeArea(
                                                  child: Scaffold(
                                                    body: Text(''),
                                                  ),
                                                );
                                              }));
                                              showDialog(
                                                  barrierDismissible: false,
                                                  context: context,
                                                  builder: (__) => endPractice(
                                                      __,
                                                      practices.length,
                                                      coc));
                                            } else {
                                              cubit.nextPage();
                                            }
                                          },
                                          style: ElevatedButton.styleFrom(
                                            minimumSize: const Size(0, 40),
                                            backgroundColor:
                                                const Color(0xff181C71),
                                          ),
                                          child: Text(
                                            cubit.index == practices.length - 1
                                                ? 'إنهاء الاختبار'
                                                : 'السؤال التالي',
                                            style: const TextStyle(
                                              color: Color(0xFFF9F9F9),
                                              fontSize: 13,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            const SizedBox(
                              height: 144,
                            ),
                            const SizedBox(
                              height: 55,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SvgPicture.asset(
                                    'assets/images/illustration/lessontest1.svg'),
                              ],
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 164,
                    decoration: const ShapeDecoration(
                      color: Color(0xFFF9F9F9),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(16),
                          bottomRight: Radius.circular(16),
                        ),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 64,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              /*GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                      'assets/images/illustration/hint.svg')),*/
                              GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                      'assets/images/illustration/exit.svg')),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Container(
                          width: 358,
                          height: 45.27,
                          decoration: ShapeDecoration(
                            shape: RoundedRectangleBorder(
                              side: const BorderSide(
                                  width: 1, color: Color(0xFF898bb5)),
                              borderRadius: BorderRadius.circular(59.05),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              RotatedBox(
                                quarterTurns: 2,
                                child: LinearPercentIndicator(
                                  barRadius: const Radius.circular(45),
                                  percent: (cubit.index + 1) / practices.length,
                                  animation: true,
                                  lineHeight: 16,
                                  progressColor: Colors.lightGreenAccent,
                                  width: 278,
                                  backgroundColor: const Color(0xffe0e0e0),
                                  animateFromLastPercent: true,
                                ),
                              ),
                              Text(
                                '${cubit.index + 1}/${practices.length}',
                                style: const TextStyle(
                                  color: Color(0xFF181C71),
                                  fontSize: 15.75,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  height: 0,
                                ),
                              ),
                              const SizedBox(
                                width: 8,
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
