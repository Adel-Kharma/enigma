import 'package:enigma/modules/lesson_screen/cubit/lesson_screen_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class LessonScreen extends StatelessWidget {
  const LessonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LessonScreenCubit>(
      create: (context) => LessonScreenCubit(),
      child: BlocConsumer<LessonScreenCubit, LessonScreenState>(
        listener: (context, state) {},
        builder: (context, state) {
          LessonScreenCubit cubit = BlocProvider.of(context);
          return SafeArea(
            child: Scaffold(
              backgroundColor: const Color(0xffFFFFFF),
              body: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Stack(
                  children: [
                    PageView.builder(
                      onPageChanged: cubit.onPageChanged,
                      controller: cubit.controller,
                      itemBuilder: (context, index) => GestureDetector(
                        onTap: () {
                          if (cubit.sectionNumberToShow + 1 == textaya.length) {
                            if (!cubit.isLast) {
                              cubit.controller.nextPage(
                                  duration: const Duration(milliseconds: 600),
                                  curve: Curves.linearToEaseOut);
                            }
                          } else {
                            cubit.showText(1);
                          }
                        },
                        child: lessonScreen(cubit: cubit),
                      ),
                      itemCount: 6,
                    ),
                    Container(
                      color: const Color(0xffFFFFFF),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(
                            width: 24,
                          ),
                          SmoothPageIndicator(
                            controller: cubit.controller,
                            count: 6,
                            effect: const ScrollingDotsEffect(
                              dotHeight: 10,
                              dotWidth: 32,
                              dotColor: Color(0xffC7D3EB),
                              activeDotColor: Color(0xff2196F3),
                            ),
                          ),
                          GestureDetector(
                              onTap: () {},
                              child: SvgPicture.asset(
                                  'assets/images/illustration/exit.svg')),
                        ],
                      ),
                    ),
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

Widget sectionText({
  required int index,
  required int shownText,
}) =>
    AnimatedOpacity(
      opacity: (shownText >= index) ? 1 : 0,
      duration: const Duration(seconds: 1),
      child: Column(
        children: [
          Text(
            textaya[index],
            textAlign: TextAlign.right,
            style: const TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w400,
              height: 0,
              letterSpacing: -0.39,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
        ],
      ),
    );

List<String> textaya = [
  'لغة ++C هي لغة برمجة عالية المستوى ومتعددة الاستخدامات. تعتبر ++C تطويرًا للغة C، حيث أضيفت إليها ميزات إضافية وتحسينات. تم تطويرها بواسطة Bjarne Stroustrup في أوائل الثمانينيات.',
  'لغة ++C هي لغة برمجة عالية المستوى ومتعددة الاستخدامات. تعتبر ++C تطويرًا للغة C، حيث أضيفت إليها ميزات إضافية وتحسينات. تم تطويرها بواسطة Bjarne Stroustrup في أوائل الثمانينيات.',
  'لغة ++C هي لغة برمجة عالية المستوى ومتعددة الاستخدامات. تعتبر ++C تطويرًا للغة C، حيث أضيفت إليها ميزات إضافية وتحسينات. تم تطويرها بواسطة Bjarne Stroustrup في أوائل الثمانينيات.',
  'لغة ++C هي لغة برمجة عالية المستوى ومتعددة الاستخدامات. تعتبر ++C تطويرًا للغة C، حيث أضيفت إليها ميزات إضافية وتحسينات. تم تطويرها بواسطة Bjarne Stroustrup في أوائل الثمانينيات.',
  'توفر ++C مفاهيم البرمجة الكائنية والتوريث والتعداد والاستثناءات والتعامل مع الذاكرة بشكل مباشر. تدعم أيضًا العديد من المكتبات القوية والإطارات التطويرية التي تسهل على المطورين بناء تطبيقات قوية ومتقدمة.',
  'توفر ++C مفاهيم البرمجة الكائنية والتوريث والتعداد والاستثناءات والتعامل مع الذاكرة بشكل مباشر. تدعم أيضًا العديد من المكتبات القوية والإطارات التطويرية التي تسهل على المطورين بناء تطبيقات قوية ومتقدمة.'
];

Widget lessonScreen({
  required LessonScreenCubit cubit,
}) =>
    SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          //cubit.components![1][1],
          const SizedBox(
            height: 32,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset('assets/images/illustration/testillus.svg'),
            ],
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'مقدمة نحو لغة ++C:',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFF6600FF),
              fontSize: 16,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: -0.48,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          const Text(
            'ماهي لغة ++C؟',
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Color(0xFFFF0000),
              fontSize: 14,
              fontFamily: 'Cairo',
              fontWeight: FontWeight.w600,
              height: 0,
              letterSpacing: -0.42,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Column(
              children: List.generate(
                  textaya.length,
                  (index) => sectionText(
                      index: index, shownText: cubit.sectionNumberToShow))),
        ],
      ),
    );
