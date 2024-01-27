import 'package:enigma/modules/lesson_test_screen/cubit/lesson_test_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import 'NumBackground.dart';
import 'lesson_test_screen/cubit/lesson_test_state.dart';

class Test extends StatelessWidget {
  const Test({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonTestCubit>(
      create: (context) => LessonTestCubit(),
      child: BlocConsumer<LessonTestCubit, LessonTestState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = LessonTestCubit.get(context);
          return Scaffold(
            backgroundColor: Color(0xff4aa1ff),
            body: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Container(
                    width: double.infinity,
                    height: 111,
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
                          padding:
                              const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                      'assets/images/illustration/exit.svg')),
                              GestureDetector(
                                  onTap: () {},
                                  child: SvgPicture.asset(
                                      'assets/images/illustration/hint.svg')),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
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
                          ],
                        ),
                      ],
                    ),
                  ),
                  Stack(children: [
                    Column(
                      children: [
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
                                  height: 5,
                                ),
                                const Text(
                                  'حيث يمكنك أن تولد مثل هذا النص أو العديد من \nالنصوص الأخرى إضافة إلى زيادة عدد الحروف التى \nيولدها التطبيق.ذا كنت تحتاج إلى عدد أكبر من \nالفقرات يتيح لك مولد النص العربى زيادة عدد الفقرات\n كما تريد، النص لن يبدو مقسما ولا يحوي أخطاء لغوية، مولد النص ',
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
                                  height: 16,
                                ),
                                Column(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          cubit.changeChosenAnswer(1);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: (1 == cubit.chosenAnswer)
                                                  ? const Color(0xFF181C71)
                                                  : const Color(0xffe0e0e0),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SvgPicture.asset(
                                                (1 == cubit.chosenAnswer)
                                                    ? 'assets/images/illustration/chosen_circle.svg'
                                                    : 'assets/images/illustration/not_chosen_circle.svg',
                                                width: 16,
                                                height: 16,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              const Flexible(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Text(
                                                      'answer',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF181C71),
                                                        fontSize: 13,
                                                        fontFamily: 'Cairo',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: GestureDetector(
                                        onTap: () {
                                          cubit.changeChosenAnswer(2);
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(8),
                                          decoration: BoxDecoration(
                                            border: Border.all(
                                              color: (2 == cubit.chosenAnswer)
                                                  ? const Color(0xFF181C71)
                                                  : const Color(0xffe0e0e0),
                                              width: 1,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(8),
                                          ),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              SvgPicture.asset(
                                                (2 == cubit.chosenAnswer)
                                                    ? 'assets/images/illustration/chosen_circle.svg'
                                                    : 'assets/images/illustration/not_chosen_circle.svg',
                                                width: 16,
                                                height: 16,
                                              ),
                                              const SizedBox(
                                                width: 8,
                                              ),
                                              const Flexible(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment
                                                          .start,
                                                  children: [
                                                    Text(
                                                      'answer',
                                                      textAlign:
                                                          TextAlign.center,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFF181C71),
                                                        fontSize: 13,
                                                        fontFamily: 'Cairo',
                                                        fontWeight:
                                                            FontWeight.w700,
                                                        height: 0,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 8,
                                    ),
                                    ElevatedButton(
                                      onPressed: () {},
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
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
