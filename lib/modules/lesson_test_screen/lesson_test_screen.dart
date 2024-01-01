import 'package:enigma/modules/lesson_test_screen/cubit/lesson_test_cubit.dart';
import 'package:enigma/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../NumBackground.dart';
import 'cubit/lesson_test_state.dart';

class LessonTestScreen extends StatelessWidget {
  const LessonTestScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonTestCubit>(
      create: (context) => LessonTestCubit(),
      child: BlocConsumer<LessonTestCubit, LessonTestState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LessonTestCubit.get(context);
          return Scaffold(
            body: NumBackground(
              child: Stack(
                children: [
                  SingleChildScrollView(
                    child: Stack(children: [
                      Column(
                        children: [
                          const SizedBox(
                            height: 111,
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(
                                    height: 70,
                                  ),
                                  const Text(
                                    'السؤال الرابع:',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFF181C71),
                                      fontSize: 20,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w800,
                                      height: 0,
                                      letterSpacing: -0.60,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  const Text(
                                    'حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق.ذا كنت تحتاج إلى عدد أكبر من الفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص ',
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                      color: Color(0xFF191919),
                                      fontSize: 13,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w700,
                                      height: 0,
                                      letterSpacing: -0.39,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  Column(
                                    children: [
                                      // multipleChoiceCard(
                                      //   questionNumber: 4,
                                      //   answer1:
                                      //       'هنا نقوم بوضع الإجابة الخاطئة للمستخدم الذي سيختار',
                                      //   answer2:
                                      //       'هنا نقوم بوضع الإجابة الخاطئة للمستخدم الذي سيختار',
                                      //   answer3:
                                      //       'هنا نقوم بوضع الإجابة الخاطئة للمستخدم الذي سيختار',
                                      //   answer4:
                                      //       'هنا نقوم بوضع الإجابة الخاطئة للمستخدم الذي سيختار',
                                      //   cubit: cubit,
                                      // ),
                                      choiceCard(
                                          answer:
                                              'هنا نقوم بوضع الإجابة الخاطئة للمستخدم الذي سيختار',
                                          index: 1,
                                          cubit: cubit),
                                      choiceCard(
                                          answer:
                                              'هنا نقوم بوضع الإجابة الخاطئة للمستخدم الذي سيختار',
                                          index: 2,
                                          cubit: cubit),
                                      choiceCard(
                                          answer:
                                              'هنا نقوم بوضع الإجابة الخاطئة للمستخدم الذي سيختار',
                                          index: 3,
                                          cubit: cubit),
                                      choiceCard(
                                          answer:
                                              'هنا نقوم بوضع الإجابة الخاطئة للمستخدم الذي سيختار',
                                          index: 4,
                                          cubit: cubit),
                                      const SizedBox(
                                        height: 8,
                                      ),
                                      AnimatedOpacity(
                                        opacity:
                                            (cubit.chosenAnswer == 0) ? 0 : 1,
                                        duration:
                                            const Duration(milliseconds: 500),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            if (cubit.chosenAnswer != 0) {}
                                          },
                                          style: ElevatedButton.styleFrom(
                                            minimumSize:
                                                const Size(double.infinity, 40),
                                            backgroundColor:
                                                const Color(0xff181C71),
                                          ),
                                          child: const Text(
                                            'السؤال التالي',
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
                                      const SizedBox(
                                        height: 16,
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          const SizedBox(
                            height: 111,
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
                  Container(
                    width: double.infinity,
                    height: 135,
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
                          height: 45,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                      'assets/images/illustration/hint.svg')),
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
                              side: BorderSide(
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
                                  percent: 0.5,
                                  animation: true,
                                  lineHeight: 16,
                                  progressColor: Colors.lightGreenAccent,
                                  width: 278,
                                  backgroundColor: const Color(0xffe0e0e0),
                                ),
                              ),
                              const Text(
                                '4/10',
                                style: TextStyle(
                                  color: Color(0xFF181C71),
                                  fontSize: 15.75,
                                  fontFamily: 'Montserrat',
                                  fontWeight: FontWeight.bold,
                                  height: 0,
                                ),
                              ),
                              SizedBox(
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
