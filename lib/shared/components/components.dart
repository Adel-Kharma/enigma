import 'package:enigma/modules/lesson_test_screen/cubit/lesson_test_cubit.dart';
import 'package:enigma/modules/onboarding_screen/model/onboarding_model.dart';
import 'package:enigma/shared/components/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

import '../../modules/onboarding_screen/onboarding_screen.dart';

Widget searchBar({
  TextEditingController? controller,
  String text = 'ابحث عن ...',
  TextInputType? keyboardType,
  //String? Function(String?)? validator,
  Widget? suffix,
  bool obscure = false,
  IconData? prefixIcon = Icons.search,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 28),
    child: TextFormField(
      controller: controller,
      obscureText: obscure,
      //validator: validator,
      keyboardType: keyboardType,
      cursorColor: primaryColor.withOpacity(.8),
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xffF4F3FD),
        prefixIcon: Icon(
          prefixIcon,
          color: const Color(0xff767676).withOpacity(0.5),
        ),
        prefixIconColor: MaterialStateColor.resolveWith((states) =>
            states.contains(MaterialState.focused)
                ? primaryColor
                : Colors.grey),
        suffixIcon: suffix,
        contentPadding: const EdgeInsets.only(left: 20),
        hintText: text,
        hintStyle: TextStyle(
            color: const Color(0xff767676).withOpacity(0.5),
            fontFamily: 'Cairo'),
        focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide:
                BorderSide(color: primaryColor.withOpacity(.8), width: 1.8)),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(color: Color(0xffF4F3FD), width: 0),
        ),
      ),
    ),
  );
}

Widget roundedButton(
    {required String text,
    required Color textColor,
    required Color backgroundColor,
    required Function? onSec,
    bool selected = false}) {
  if (selected) {
    Color t = textColor;
    textColor = backgroundColor;
    backgroundColor = t;
  }

  return InkWell(
    highlightColor: Colors.cyan,
    onTap: () {
      onSec!();
    },
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(45), color: backgroundColor),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 16),
        child: Text(
          text,
          style: TextStyle(
              color: textColor,
              fontWeight: FontWeight.bold,
              fontFamily: 'Cairo'),
        ),
      ),
    ),
  );
}

Widget doneCard(
    {required Color color,
    required String image,
    required int stars,
    required String title,
    required String subtitle}) {
  return Container(
      padding: const EdgeInsets.all(16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: color,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.bold,
                        color: Color(0xfff0f0f0),
                        fontSize: 20),
                  ),
                  const SizedBox(
                    width: 12,
                  ),
                  SvgPicture.asset(
                    'assets/images/illustration/star.svg',
                    width: 19,
                    height: 19,
                  ),
                  const SizedBox(
                    width: 2,
                  ),
                  SvgPicture.asset(
                    'assets/images/illustration/star.svg',
                    width: 19,
                    height: 19,
                  ),
                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xffFF8504),
                  ),
                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xffFF8504),
                  ),
                  const Icon(
                    Icons.star_rounded,
                    color: Color(0xffFF8504),
                  ),
                  // SizedBox(
                  //   width: 6,
                  // )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  subtitle,
                  style: const TextStyle(
                      fontFamily: 'Cairo',
                      color: Color(0xfff0f0f0),
                      fontSize: 10),
                ),
              )
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  color: const Color(0xffFF8504),
                  borderRadius: BorderRadius.circular(45)),
              height: 66,
              width: 66,
              child: SvgPicture.asset(
                image,
                height: 60,
                width: 60,
              ))
        ],
      ));
}

Widget progressCard({
  required String title,
  required String subtitle,
  required String image,
  required double percent,
  required Function() onTap,
}) {
  return GestureDetector(
    onTap: onTap,
    child: Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16),
        color: const Color(0xfff9f9f9),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 22,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 16,
                  ),
                  Text(
                    title,
                    style: const TextStyle(
                        fontFamily: 'Cairo',
                        color: Color(0xff181C71),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                    maxLines: 1,
                    overflow: TextOverflow.fade,
                  ),
                  const Icon(
                    Icons.arrow_forward_ios_rounded,
                    color: Color(0xff181C71),
                    size: 13,
                  )
                ],
              ),
              const SizedBox(
                height: 4,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 17,
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                        color: Color(0xff767676),
                        fontSize: 8,
                        fontFamily: 'Montserrat'),
                  ),
                ],
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 135,
                  ),
                  Text(
                    '${(percent * 100).toInt()}%',
                    style: const TextStyle(
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                children: [
                  const SizedBox(
                    width: 7,
                  ),
                  RotatedBox(
                    quarterTurns: 2,
                    child: LinearPercentIndicator(
                      barRadius: const Radius.circular(45),
                      percent: percent,
                      animation: true,
                      lineHeight: 10,
                      progressColor: Colors.lightGreenAccent,
                      width: 170,
                      backgroundColor: const Color(0xffe0e0e0),
                    ),
                  ),
                ],
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 9.0, horizontal: 8),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
              ),
              height: 103,
              clipBehavior: Clip.antiAliasWithSaveLayer,
              child: Image.asset(
                'assets/images/progress_screen_test_image.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    ),
  );
}

Widget levelsCard(
    {required String text, required bool isOpened, Function? onTap}) {
  return GestureDetector(
    onTap: () {
      onTap!();
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
        width: double.infinity,
        decoration: BoxDecoration(
          color: const Color(0xFFF5F5F5),
          borderRadius: BorderRadius.circular(8),
          boxShadow: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 8,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              textAlign: TextAlign.right,
              style: const TextStyle(
                color: Color(0xFF181C71),
                fontSize: 13,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
                height: 0,
              ),
            ),
            if (isOpened)
              RotatedBox(
                  quarterTurns: 1,
                  child: SvgPicture.asset(
                      'assets/images/illustration/drop_down_icon.svg'))
            else
              SvgPicture.asset('assets/images/illustration/lock_icon.svg')
          ],
        ),
      ),
    ),
  );
}

Widget onboardingContent({required context, required int index}) {
  (index == 2) ? lastPageFlag = true : lastPageFlag = false;
  return Stack(children: [
    Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /*(index == 0)
                ? SvgPicture.asset(
                    'assets/images/illustration/onboarding_up_$index.svg',
                    width: MediaQuery.of(context).size.width,
                  )
                : const SizedBox(),*/
            SvgPicture.asset(
              'assets/images/illustration/onboarding_up_${index + 1}.svg',
              width: MediaQuery.of(context).size.width,
            ),
          ],
        ),
        Row(
          children: [
            SvgPicture.asset(
              'assets/images/illustration/onboarding_down_${index + 1}.svg',
              width: MediaQuery.of(context).size.width,
            ),
          ],
        )
      ],
    ),
    Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            SvgPicture.asset(
              'assets/images/illustration/onboarding${index + 1}.svg',
            ),
            const SizedBox(
              height: 87,
            ),
            Text(
              titles[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF191919),
                fontSize: 20,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w800,
                height: 0,
                letterSpacing: -0.60,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              subtitles[index],
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Color(0xFF767676),
                fontSize: 13,
                fontFamily: 'Cairo',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: -0.39,
              ),
            ),
          ],
        ),
      ),
    ),
  ]);
}

Widget choiceCard({
  required String answer,
  required int index,
  required LessonTestCubit cubit,
}) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: GestureDetector(
      onTap: () {
        cubit.changeChosenAnswer(index);
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: (index == cubit.chosenAnswer)
                ? const Color(0xFF181C71)
                : const Color(0xffe0e0e0),
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(
              (index == cubit.chosenAnswer)
                  ? 'assets/images/illustration/chosen_circle.svg'
                  : 'assets/images/illustration/not_chosen_circle.svg',
              width: 16,
              height: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    answer,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      color: Color(0xFF181C71),
                      fontSize: 13,
                      fontFamily: 'Cairo',
                      fontWeight: FontWeight.w700,
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
  );
}

Widget choiceCardForWidget(
    {required Widget answer,
    required int index,
    required LessonTestCubit cubit,
    required int pageIndex}) {
  Color borderColor;

  if (cubit.revealAns) {
    if (index == 1) {
      borderColor = const Color(0xFF00BC12);
    } else {
      if (index == cubit.chosenAnswer[pageIndex]) {
        borderColor = const Color(0xFFFF4B4C);
      } else {
        borderColor = const Color(0xffe0e0e0);
      }
    }
  } else {
    borderColor = (index == cubit.chosenAnswer[pageIndex])
        ? const Color(0xFF181C71)
        : const Color(0xffe0e0e0);
  }

  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: GestureDetector(
      onTap: () {
        if (cubit.revealAns == false) {
          cubit.changeChosenAnswer(index);
        }
      },
      child: Container(
        padding: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          border: Border.all(
            color: borderColor,
            width: 1,
          ),
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            SvgPicture.asset(
              (index == cubit.chosenAnswer[pageIndex])
                  ? 'assets/images/illustration/chosen_circle.svg'
                  : 'assets/images/illustration/not_chosen_circle.svg',
              width: 16,
              height: 16,
            ),
            const SizedBox(
              width: 8,
            ),
            Flexible(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [answer],
              ),
            ),
          ],
        ),
      ),
    ),
  );
}

Widget multipleChoiceCard(
    {required int questionNumber,
    required String answer1,
    required String answer2,
    required String answer3,
    required String answer4,
    required LessonTestCubit cubit}) {
  //cubit.chosenAnswer = 0;
  return Column(
    children: [
      choiceCard(answer: answer1, index: 1, cubit: cubit),
      choiceCard(answer: answer2, index: 2, cubit: cubit),
      choiceCard(answer: answer3, index: 3, cubit: cubit),
      choiceCard(answer: answer4, index: 4, cubit: cubit),
    ],
  );
}

Widget endPractice(BuildContext context, int all, int corr) {
  return PopScope(
    canPop: false,
    child: AlertDialog(
      backgroundColor: const Color(0xFFFFFFFF),
      content: SizedBox(
        height: 420,
        width: 420,
        child: Center(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          //mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const SizedBox(
              height: 16,
            ),
            SvgPicture.asset(
              'assets/images/illustration/complete_course.svg',
              width: 212,
            ),
            const SizedBox(
              height: 8,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'أحسنت صنعاً!',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF4B54FF),
                    fontSize: 24,
                    fontFamily: 'Cairo',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    const Text(
                      'النتيجة:',
                      style: TextStyle(
                        color: Color(0xFF5D7285),
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: -0.60,
                      ),
                    ),
                    Text(
                      '$corr/$all',
                      style: const TextStyle(
                        color: Color(0xFF5D7285),
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: -0.60,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.pop(context);
                  },
                  highlightColor: const Color(0x354b54ff),
                  child: ListTile(
                    title: const Text(
                      'قم بالعودة لرؤية إجاباتك',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF4B54FF),
                        fontSize: 16,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        decoration: TextDecoration.underline,
                        height: 0,
                      ),
                    ),
                    horizontalTitleGap: 0,
                    trailing: Transform.rotate(
                      child: Icon(Icons.arrow_back_ios),
                      angle: 3.14159,
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
              },
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Container(
                  height: 32,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 32, vertical: 4),
                  decoration: ShapeDecoration(
                    color: const Color(0xFF4B55FF),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
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
        )),
      ),
    ),
  );
}
