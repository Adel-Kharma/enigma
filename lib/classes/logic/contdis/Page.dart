import 'package:enigma/modules/lesson_test_screen/cubit/lesson_test_cubit.dart';
import 'package:enigma/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:xml/xml.dart';


class Page {
  String content;
  late final document;

  Page(this.content) {
    document = XmlDocument.parse(content);
  }

  //Widget getQuestion() {}

  //Widget getLecture() {}

  Widget getPage(LessonTestCubit cubit, BuildContext context,
      List<int> randomI) {
    String rootName = document.rootElement.name.toString();
    List<Widget> list = [];

    if (rootName == 'qpage') {
      for (int i = 0; i < 5; i++) {
        String name = document.children[0].childElements
            .elementAt(i)
            .name
            .toString()
            .replaceAll('\n', '');
        String text = document.children[0].childElements
            .elementAt(i)
            .text
            .toString()
            .replaceAll('\n', '');

        switch (name) {
          case 'text':
            list.add(Text(
              text,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  color: Color(0xff000000),
                  fontSize: 15,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.39),
            ));
            break;
          case 'img':
            list.add(Image(
              image: AssetImage(
                  'assets/res/${document.children[0].childElements.elementAt(i)
                      .getAttribute('src')
                      .toString()}.png'),
            ));
            break;
        }
      }

      List<Widget> sourceAnswers = [
        choiceCardForWidget(answer: list[1], index: 1, cubit: cubit),
        choiceCardForWidget(answer: list[2], index: 2, cubit: cubit),
        choiceCardForWidget(answer: list[3], index: 3, cubit: cubit),
        choiceCardForWidget(answer: list[4], index: 4, cubit: cubit),
      ];
      List<Widget> randomized = [];

      while (randomized.length != 4) {
        randomized.add(sourceAnswers[randomI[randomized.length]]);
      }

      randomized.add(const SizedBox(
        height: 8,
      ));
      randomized.add(AnimatedOpacity(
        opacity: (cubit.chosenAnswer == 0) ? 0 : 1,
        duration: const Duration(milliseconds: 500),
        child: ElevatedButton(
          onPressed: () {
            if (cubit.chosenAnswer != 0) {
              showModalBottomSheet(
                backgroundColor: const Color(0xFFF9F9F9),
                context: context,
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16),
                    topRight: Radius.circular(16),
                  ),
                ),
                builder: (_) {
                  if (cubit.chosenAnswer == 1) {
                    return bottomSheetCelebration(context);
                  } else {
                    return bottomSheetBahdalation(context);
                  }
                },
              );
            }
          },
          style: ElevatedButton.styleFrom(
            minimumSize: const Size(double.infinity, 40),
            backgroundColor: const Color(0xff181C71),
          ),
          child: const Text(
            'تحقق من الإجابة',
            style: TextStyle(
              color: Color(0xFFF9F9F9),
              fontSize: 15,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
              height: 0,
            ),
          ),
        ),
      ));

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'اختبار مفاجئ:',
              textAlign: TextAlign.right,
              style: TextStyle(
                  color: Color(0xffff0000),
                  fontSize: 18,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.42),
            ),
            list[0],
            const SizedBox(
              height: 50,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: randomized,
            ),
            const SizedBox(
              height: 160,
            )
          ],
        ),
      );
    } else if (rootName == 'page') {
      int count = document.children[0].childElements.length;

      int h2Count = 0;
      for (int j = 0; j < count; j++) {
        String name = document.children[0].childElements
            .elementAt(j)
            .name
            .toString()
            .replaceAll('\n', '');
        switch (name) {
          case 'h2':
            h2Count++;
            // print(h2Count);
            break;
        }
      }

      for (int i = 0; i < count; i++) {
        String name = document.children[0].childElements
            .elementAt(i)
            .name
            .toString()
            .replaceAll('\n', '');
        String text = document.children[0].childElements
            .elementAt(i)
            .text
            .toString()
            .replaceAll('\n', '');
        switch (name) {
          case 'h1':
            list.add(Text(
              text,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  color: Color(0xff6600ff),
                  fontSize: 18,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w700,
                  letterSpacing: -0.48),
            ));
            break;
          case 'h2':
            list.add(Text(
              text,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  color: Color(0xffff0000),
                  fontSize: 16,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w600,
                  letterSpacing: -0.42),
            ));
            list.add(const SizedBox(
              height: 2,
            ));
            break;
          case 'text':
            list.add(Text(
              text,
              textAlign: TextAlign.right,
              style: const TextStyle(
                  color: Color(0xff000000),
                  fontSize: 15,
                  fontFamily: 'Cairo',
                  fontWeight: FontWeight.w400,
                  letterSpacing: -0.39),
            ));
            break;
          case 'img':
            list.add(Image(
              image: AssetImage(
                  'assets/res/${document.children[0].childElements.elementAt(i)
                      .getAttribute('src')}.png'),
            ));
            list.add(const SizedBox(
              height: 8,
            ));
            break;
        }
      }

      return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: list,
        ),
      );
    }

    return const Text('no context');
  }

  Widget bottomSheetCelebration(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 16,
            ),
            SvgPicture.asset('assets/images/illustration/iamproundofyou.svg'),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'إجابة صحيحة!',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFF00BC12),
                    fontSize: 20,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w800,
                    height: 0,
                    letterSpacing: -0.60,
                  ),
                ),
                Text(
                  'هذا رائع، لا شك بأنك نيرد!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x7F00BC13),
                    fontSize: 13,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: -0.39,
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 32,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 4),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF00BC12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'استمر في التقدّم',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }

  Widget bottomSheetBahdalation(BuildContext context) {
    return Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 16,
            ),
            SvgPicture.asset('assets/images/illustration/wornganswer.svg'),
            const Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'إجابة خاطئة!',
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    color: Color(0xFFFF4B4C),
                    fontSize: 20,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w800,
                    height: 0,
                    letterSpacing: -0.60,
                  ),
                ),
                Text(
                  'لا تقلق، فكلنا نخطئ في النهاية',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0x7FFF4B4C),
                    fontSize: 13,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w700,
                    height: 0,
                    letterSpacing: -0.39,
                  ),
                )
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 32,
                  padding: const EdgeInsets.symmetric(
                      horizontal: 32, vertical: 4),
                  decoration: ShapeDecoration(
                    color: const Color(0xFFFF4B4C),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  child: const Center(
                    child: Text(
                      'استمر في التقدّم',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 13,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ));
  }
}
