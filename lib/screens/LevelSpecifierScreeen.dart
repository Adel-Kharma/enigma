// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:enigma/classes/level_progress.dart';
import 'package:enigma/classes/logic/contdis/Lesson.dart';
import 'package:enigma/classes/logic/contdis/LessonReader.dart';
import 'package:enigma/classes/logic/contdis/Topic.dart';
import 'package:enigma/modules/lesson_test_screen/lesson_test_screen.dart';
import 'package:enigma/screens/widgets/closed_section_card.dart';
import 'package:enigma/screens/widgets/exercise_card.dart';
import 'package:enigma/screens/widgets/opened_section_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:intrinsic_grid_view/intrinsic_grid_view.dart';

import '../shared/cubit/level_specifier/cubit.dart';
import 'widgets/level_specifier_top_bar.dart';

class LevelSpecifierScreen extends StatelessWidget {
  const LevelSpecifierScreen({super.key, required this.lessonList});

  final List<LessonReader> lessonList;

  @override
  Widget build(BuildContext context) {
    List<Widget> topics = [];
    topics.add(
      SizedBox(
        height: 24,
      ),
    );
    for (int j = 0; j < lessonList.length; j++) {
      topics.add(
        OpenedSection(
            title: lessonList[j].title,
            levelContent: List<Topic>.generate(lessonList[j].getTopics().length,
                (index) => lessonList[j].getTopics()[index]),
            pages: lessonList[j].getPages()),
      );
    }

    return BlocProvider<LevelSpecifierCubit>(
        create: (context) => LevelSpecifierCubit(topics, lessonList),
        child: BlocConsumer<LevelSpecifierCubit, LevelSpecifierState>(
            listener: (context, state) {},
            builder: (context, state) {
              var cubit = LevelSpecifierCubit.get(context);

              return Scaffold(
                body: SafeArea(
                    child: Stack(
                  children: [
                    Container(
                      color: Color(0x800961f5),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20.0),
                        child: SvgPicture.asset(
                          'assets/images/offercard.svg',
                          height: 240,
                          allowDrawingOutsideViewBox: true,
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
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
                    CustomScrollView(
                      slivers: [
                        SliverFillRemaining(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 82, right: 16, left: 8),
                                  child: Row(
                                    //crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      const Column(
                                        //mainAxisSize: MainAxisSize.min,
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'المستوى الأوّل',
                                            style: TextStyle(
                                              color: Color(0xFFF9F9F9),
                                              fontSize: 24,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w800,
                                              height: 0,
                                              letterSpacing: -1.20,
                                            ),
                                          ),
                                          SizedBox(height: 8),
                                          SizedBox(
                                            width: 210,
                                            child: Text(
                                              'يساعدك هذا المستوى على اكتساب الأساسيات التي سترافقك في مسيرتك التعليمية',
                                              textAlign: TextAlign.right,
                                              style: TextStyle(
                                                color: Color(0xFFF9F9F9),
                                                fontSize: 13,
                                                fontFamily: 'Cairo',
                                                fontWeight: FontWeight.w700,
                                                height: 0,
                                                letterSpacing: -0.39,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Expanded(
                                        flex: 10,
                                        child: SvgPicture.asset(
                                          'assets/images/illustration/teamcollabrating.svg',
                                          //height: 220,
                                          allowDrawingOutsideViewBox: true,
                                          //fit: BoxFit.fitWidth,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Stack(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(top: 36.0),
                                      child: Container(
                                        decoration: ShapeDecoration(
                                          color: Color(0xFFF9F9F9),
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(16),
                                              topRight: Radius.circular(16),
                                            ),
                                          ),
                                        ),
                                        child: cubit.content,
                                      ),
                                    ),

                                    //progress
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    LevelSpecifierTopBar(
                      index: cubit.index,
                      onSec1: () {
                        cubit.changeContent(0);
                      },
                      onSec2: () {
                        cubit.changeContent(1);
                      },
                    ),
                  ],
                )),
              );
            }));
  }
}

class Section1 extends StatelessWidget {
  const Section1({
    super.key,
    required this.widgets,
  });

  final List<Widget> widgets;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: widgets,
    );
  }
}

class Section2 extends StatelessWidget {
  const Section2({
    super.key,
    required this.testContents,
  });

  final List<LessonReader> testContents;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 24,
        ),
        IntrinsicGridView.vertical(
          horizontalSpace: 16,
          verticalSpace: 12,
          children: List.generate(
            testContents.length,
            (index) =>
                ExerciseCard(practices: testContents[index].getPractices()),
          ),
        ),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}
