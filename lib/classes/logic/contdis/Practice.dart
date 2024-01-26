import 'package:enigma/modules/lesson_test_screen/cubit/lesson_test_cubit.dart';
import 'package:enigma/shared/components/components.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import 'package:xml/xml.dart';

class Practice {
  String content;
  late final document;

  Practice(this.content) {
    document = XmlDocument.parse(content);
  }

  Widget getPage(
    LessonTestCubit cubit,
    List<int> randomI,
    int num,
    int pageIndex,
    BuildContext context,
  ) {
    String rootName = document.rootElement.name.toString();
    List<Widget> list = [];

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
                'assets/res/${document.children[0].childElements.elementAt(i).getAttribute('src').toString()}.png'),
          ));
          break;
        case 'lax':
          list.add(Align(
            alignment: Alignment.centerRight,
            child: Localizations.override(
              child: Math.tex(text),
              locale: const Locale('en'),
              context: context,
            ),
          ));
          break;
        case 'group':
          int len = document.children[0].childElements
              .elementAt(i)
              .childElements
              .length;
          List<Widget> smLis = [];
          for (int j = 0; j < len; j++) {
            String namee = document.children[0].childElements
                .elementAt(i)
                .childElements
                .elementAt(j)
                .name
                .toString()
                .replaceAll('\n', '');
            String textt = document.children[0].childElements
                .elementAt(i)
                .childElements
                .elementAt(j)
                .text
                .toString()
                .replaceAll('\n', '');
            switch (namee) {
              case 'text':
                smLis.add(Text(
                  textt,
                  textAlign: TextAlign.right,
                  style: const TextStyle(
                      color: Color(0xff000000),
                      fontSize: 15,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w400,
                      letterSpacing: -0.39),
                ));
                break;
              case 'lax':
                smLis.add(Align(
                  alignment: Alignment.centerRight,
                  child: Localizations.override(
                      context: context,
                      locale: const Locale('en'),
                      child: Math.tex(textt)),
                ));
                break;
            }
          }
          list.add(Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: smLis,
          ));
          break;
      }
    }

    List<Widget> sourceAnswers = [
      choiceCardForWidget(
          answer: list[1], index: 1, cubit: cubit, pageIndex: pageIndex),
      choiceCardForWidget(
          answer: list[2], index: 2, cubit: cubit, pageIndex: pageIndex),
      choiceCardForWidget(
          answer: list[3], index: 3, cubit: cubit, pageIndex: pageIndex),
      choiceCardForWidget(
          answer: list[4], index: 4, cubit: cubit, pageIndex: pageIndex),
    ];
    List<Widget> randomized = [];

    while (randomized.length != 4) {
      randomized.add(sourceAnswers[randomI[randomized.length]]);
    }
    randomized.add(const SizedBox(
      height: 8,
    ));

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'السؤال رقم  ($num)',
          textAlign: TextAlign.right,
          style: const TextStyle(
            color: Color(0xFF181C71),
            fontSize: 20,
            fontFamily: 'Cairo',
            fontWeight: FontWeight.w800,
            height: 0,
            letterSpacing: -0.60,
          ),
        ),
        list[0],
        const SizedBox(
          height: 50,
        ),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: randomized,
        ),
      ],
    );
  }
}
