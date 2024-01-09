import 'dart:ui';

import 'package:enigma/classes/logic/contdis/Practice.dart';
import 'package:enigma/modules/lesson_test_screen/lesson_test_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    super.key,
    this.color = const Color(0xff181C71),
    this.title = 'تحدي شغلة',
    this.imagepath = 'assets/images/progress_screen_test_image.png',
    this.svgPath = 'assets/images/illustration/thinker.svg',
    required this.practices,
  });

  final Color color;
  final String title;
  final String imagepath;
  final String svgPath;
  final List<Practice> practices;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => LessonTestScreen(practices: practices)));
      },
      child: SizedBox(
          height: 200,
          child: InkWell(
            child: Container(
              clipBehavior: Clip.antiAlias,
              decoration: ShapeDecoration(
                shadows: [
                  BoxShadow(
                      color: Color(0x66000000),
                      blurRadius: 8,
                      spreadRadius: 0.04,
                      blurStyle: BlurStyle.normal),
                  BoxShadow(
                      color: color,
                      blurRadius: 0,
                      spreadRadius: 0.04,
                      offset: Offset(4, 4)),
                ],
                color: Colors.blueGrey,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(16),
                  ),
                ),
              ),
              child: Stack(children: [
                ImageFiltered(
                  imageFilter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                  child: Container(
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(imagepath),
                        fit: BoxFit.cover,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16),
                        ),
                      ),
                    ),
                  ),
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    Center(
                      child: SvgPicture.asset(
                        svgPath,
                        height: 100,
                        width: 100,
                        fit: BoxFit.fill,
                      ),
                    ),
                    Positioned(
                        bottom: 8,
                        child: Container(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16, vertical: 4),
                          decoration: ShapeDecoration(
                            color: color,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                title,
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 13,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                ),
                              ),
                            ],
                          ),
                        ))
                  ],
                ),
              ]),
            ),
          )),
    );
  }
}
