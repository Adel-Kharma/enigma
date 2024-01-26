import 'package:enigma/classes/logic/contdis/LessonReader.dart';
import 'package:enigma/screens/LevelSpecifierScreeen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../shared/components/components.dart';
import '../NumBackground.dart';
import 'cubit/educational_screens_cubit.dart';

class EducationalScreens extends StatelessWidget {
  const EducationalScreens({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<EducationalScreensCubit>(
      create: (context) => EducationalScreensCubit(),
      child: BlocConsumer<EducationalScreensCubit, EducationalScreensState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = EducationalScreensCubit.get(context);

          return MediaQuery(
            data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
            child: Scaffold(
              appBar: AppBar(
                backgroundColor: const Color(0xff03A9F4),
                leading: IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_sharp,
                    color: Color(0xffF9F9F9),
                  ),
                ),
                centerTitle: true,
                title: const Text(
                  'مرحباً، اسم المستخدم',
                  style: TextStyle(
                      fontFamily: 'Cairo',
                      color: Color(0xffF9F9F9),
                      fontWeight: FontWeight.bold),
                  overflow: TextOverflow.fade,
                  maxLines: 1,
                ),
              ),
              body: NumBackground(
                child: Column(
                  children: [
                    //searchBar(),
                    const SizedBox(
                      height: 16,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        roundedButton(
                            text: 'تم الإكمال',
                            textColor: const Color(0xff181C71),
                            backgroundColor: const Color(0xffF9F9F9),
                            onSec: () {
                              cubit.changeContent(2);
                            },
                            selected: (cubit.index == 2)),
                        const SizedBox(
                          width: 8,
                        ),
                        roundedButton(
                            text: 'قيد الممارسة',
                            textColor: const Color(0xff181C71),
                            backgroundColor: const Color(0xffF9F9F9),
                            onSec: () {
                              cubit.changeContent(1);
                            },
                            selected: (cubit.index == 1)),
                        const SizedBox(
                          width: 8,
                        ),
                        roundedButton(
                            text: 'مستويات',
                            textColor: const Color(0xff181C71),
                            backgroundColor: const Color(0xffF9F9F9),
                            onSec: () {
                              cubit.changeContent(0);
                            },
                            selected: (cubit.index == 0)),
                      ],
                    ),
                    cubit.content
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class LevelsSection extends StatelessWidget {
  const LevelsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        SvgPicture.asset(
          'assets/images/illustration/boyonpuzzle.svg',
        ),
        const Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 16,
            ),
            Text(
              'اكتشف قوتك واختر مستواك:',
              textAlign: TextAlign.right,
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w800,
                height: 0,
                letterSpacing: -1.20,
              ),
            ),
          ],
        ),
        levelsCard(
            text: 'المستوى الأوّل',
            isOpened: true,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LevelSpecifierScreen(
                            desc:
                                'يساعدك هذا المستوى على اكتساب الأساسيات التي سترافقك في مسيرتك التعليمية',
                            title: 'المستوى الأول',
                            lessonList: [
                              LessonReader(1),
                              LessonReader(2),
                              LessonReader(3),
                              LessonReader(4),
                            ], //todo add more lesson
                          )));
            }),
        levelsCard(
            text: 'المستوى الثاني',
            isOpened: true,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LevelSpecifierScreen(
                            title: 'المستوى الثاني',
                            desc:
                                'يساعدك هذا المستوى على تمكين الأساسيات التي سترافقك في مسيرتك التعليمية',
                            lessonList: [
                              LessonReader(5),
                              LessonReader(6),
                              LessonReader(7),
                              LessonReader(8),
                              LessonReader(9),
                            ],
                          )));
            }),
        levelsCard(
            text: 'المستوى الثالث',
            isOpened: true,
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => LevelSpecifierScreen(
                            title: 'المستوى الثالث',
                            desc:
                                'يساعدك هذا المستوى على احتراف الأساسيات التي سترافقك في مسيرتك التعليمية',
                            lessonList: [
                              LessonReader(10),
                              LessonReader(11),
                              LessonReader(12),
                              LessonReader(13),
                              LessonReader(14),
                            ],
                          )));
            }),
      ],
    );
  }
}

class ProgressSection extends StatelessWidget {
  const ProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(
          height: 16,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: progressCard(
              title: 'اسم خاص بالتدريب',
              subtitle: 'منذ ساعتين وخمس دقائق',
              image: 'assets/images/done_screen_test_image.svg',
              percent: 0.8,
              onTap: () {}),
        )
      ],
    );
  }
}

class DoneSection extends StatelessWidget {
  const DoneSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SizedBox(
            height: 16,
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                  color: Color(0xffF9F9F9),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16))),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 31,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          width: 220,
                          child: Text(
                            'عبارة تخبر المستخدم بتقدمه الجيد أو السيء الذي يحرزه في التعلم والإنجاز',
                            style: TextStyle(
                                color: Color(0xff181C71),
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                fontFamily: 'Cairo'),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        SizedBox(
                          width: 100,
                          child: CircularPercentIndicator(
                            radius: 45.0,
                            lineWidth: 10.0,
                            animation: true,
                            percent: 0.7,
                            center: const Text(
                              "70%",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  fontFamily: 'Montserrat'),
                            ),
                            circularStrokeCap: CircularStrokeCap.round,
                            progressColor: const Color(0xff06FF1F),
                          ),
                        ),
                        const SizedBox(
                          width: 10,
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 28,
                    ),
                    doneCard(
                        color: Colors.blue,
                        image:
                            'assets/images/illustration/done_screen_image_1.svg',
                        stars: 3,
                        title: 'عبارة وصفية',
                        subtitle:
                            'هنا نخبر المستخدم باسم الشيء المنجز والوقت الذي استغرقه لهذا الأمر'),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
