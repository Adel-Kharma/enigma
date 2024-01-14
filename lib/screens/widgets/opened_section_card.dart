import 'package:enigma/classes/logic/contdis/Page.dart' as lesson_page;
import 'package:enigma/classes/logic/contdis/Topic.dart';
import 'package:enigma/modules/lesson_screen/lesson_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../classes/level_progress.dart';

class OpenedSection extends StatelessWidget {
  const OpenedSection(
      {super.key,
      this.title = 'بدون عنوان',
      required this.levelContent,
      required this.pages});

  final String title;
  final List<Topic> levelContent;
  final List<lesson_page.Page> pages;

  @override
  Widget build(BuildContext context) {
    /*List<Widget>? finalList = levelContent;
    //finalList.add();
    finalList = finalList.reversed.toList();*/
    List<Widget> finalList = List.generate(
        levelContent.length,
        (index) => LevelContentItem(
              levelState: LevelState.Undone,
              title: levelContent[index].title,
              desc: levelContent[index].desc,
            ));

    finalList.add(
      const SizedBox(
        height: 8,
      ),
    );

    finalList = finalList.reversed.toList();

    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, right: 16, left: 16),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => LessonScreen(
                        pages: pages,
                      )));
        },
        child: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              decoration: ShapeDecoration(
                gradient: const LinearGradient(
                  begin: Alignment(0.86, 0.51),
                  end: Alignment(-0.86, -0.51),
                  colors: [Color(0xFF1A6EFC), Color(0xCC0961F5)],
                ),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 6,
                      right: 44.0,
                    ),
                    child: Text(
                      title,
                      textAlign: TextAlign.right,
                      style: const TextStyle(
                        color: Color(0xFFE9E9E9),
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w800,
                        height: 0,
                        letterSpacing: -0.48,
                      ),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(right: 44.0, left: 32.0),
                    child: Divider(
                        height: 20, thickness: 2, color: Color(0x80E0E0E0)),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    verticalDirection: VerticalDirection.up,
                    //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: finalList,
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, top: 11),
              child: CircularPercentIndicator(
                  percent: 0.5,
                  lineWidth: 3,
                  backgroundColor: const Color(0xFFFFFFFF),
                  progressColor: const Color(0xBFE71D36),
                  fillColor: const Color(0xff1f70f9),
                  radius: 12),
            ),
          ],
        ),
      ),
    );
  }
}

class LevelContentItem extends StatelessWidget {
  LevelContentItem(
      {super.key, required this.levelState, this.title = '', this.desc = ''});

  final LevelState levelState;
  late double _radius, _position;
  String title, desc;

  @override
  Widget build(BuildContext context) {
    if (levelState == LevelState.Undone) {
      _radius = 16;
      _position = 5.5;
    } else if (levelState == LevelState.OnProgress) {
      _radius = 12;
      _position = 8.5;
    } else {
      _radius = 20;
      _position = 5.5;
    }
    return Padding(
      padding: const EdgeInsets.only(bottom: 4.0),
      child: Row(
        children: [
          SizedBox(
            height: 45,
            width: 44,
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.topCenter,
              children: [
                const Positioned(
                  top: -40,
                  child: SizedBox(
                      height: 55,
                      child: VerticalDivider(
                        thickness: 2,
                        color: Color(0x80E0E0E0),
                      )),
                ),
                Positioned(
                  top: _position,
                  child: Container(
                    width: _radius,
                    height: _radius,
                    decoration: ShapeDecoration(
                      color: (levelState == LevelState.OnProgress
                          ? const Color(0xFFE71D36)
                          : const Color(0xFFF9F9F9)),
                      shape: const OvalBorder(),
                    ),
                    child: Center(
                      child: (levelState == LevelState.Done
                          ? SvgPicture.asset(
                              'assets/images/tick.svg',
                            )
                          : const Text('')),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              textBaseline: TextBaseline.ideographic,
              children: [
                SizedBox(
                  height: 26,
                  child: Text(
                    title,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
                      height: 0,
                      letterSpacing: -0.39,
                    ),
                  ),
                ),
                SizedBox(
                  height: 19,
                  child: Text(
                    desc,
                    textAlign: TextAlign.right,
                    style: const TextStyle(
                      color: Color(0x7FF9F9F9),
                      fontSize: 10,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      height: 0,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
