// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:ui';

import 'package:enigma/classes/level_progress.dart';
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
  const LevelSpecifierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LevelSpecifierCubit>(
        create: (context) => LevelSpecifierCubit(),
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
                                              'نص تحفيزي يحفز المستخدم عند دخوله لهذا المستوى',
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

class Section2 extends StatelessWidget {
  const Section2({
    super.key,
  });

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
            children: [
              ExerciseCard(),
              ExerciseCard(
                color: Color(0xffE71D36),
              ),
              ExerciseCard(
                svgPath: 'assets/images/illustration/smiling.svg',
              ),
              ExerciseCard(
                color: Color(0xffFF9C07),
              ),
              ExerciseCard(
                svgPath: 'assets/images/illustration/tongueriser.svg',
              ),
              ExerciseCard(),
              ExerciseCard(),
            ]),
        SizedBox(
          height: 16,
        )
      ],
    );
  }
}

class Section1 extends StatelessWidget {
  const Section1({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: 24,
        ),
        OpenedSection(),
        ClosedSection(),
        ClosedSection(),
        ClosedSection(),
        ClosedSection(),
      ],
    );
  }
}
