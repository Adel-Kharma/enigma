import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TestResultScreen extends StatelessWidget {
  const TestResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaleFactor: 1.0),
      child: Scaffold(
        backgroundColor: const Color(0x004a4a4a).withOpacity(1),
        body: AlertDialog(
          backgroundColor: const Color(0xffF9F9F9),
          shape: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(16)),
          content: SizedBox(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SvgPicture.asset(
                    'assets/images/illustration/complete_course.svg'),
                const SizedBox(
                  height: 16,
                ),
                const Text(
                  'عبارة وصفية',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFF181C71),
                    fontSize: 24,
                    fontFamily: 'Jost',
                    fontWeight: FontWeight.w600,
                    height: 0,
                  ),
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.star_rounded,
                      color: Color(0xffb4bdc4),
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: Color(0xffFF8504),
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: Color(0xffFF8504),
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: Color(0xffFF8504),
                    ),
                    Icon(
                      Icons.star_rounded,
                      color: Color(0xffFF8504),
                    ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'النتيجة:',
                      style: TextStyle(
                        color: Color(0x7F767676),
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: -0.60,
                      ),
                    ),
                    SizedBox(
                      width: 26,
                    ),
                    Text(
                      '9/10',
                      style: TextStyle(
                        color: Color(0x7F767676),
                        fontSize: 20,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w400,
                        height: 0,
                        letterSpacing: -0.60,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: const Text(
                          'قم بالعودة لرؤية إجاباتك',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF181C71),
                            fontSize: 13,
                            fontFamily: 'Cairo',
                            fontWeight: FontWeight.w700,
                            decoration: TextDecoration.underline,
                            height: 0,
                          ),
                        )),
                    GestureDetector(
                      onTap: () {},
                      child: const Icon(
                        Icons.arrow_forward_ios_rounded,
                        size: 20,
                      ),
                    )
                  ],
                ),
                ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      minimumSize: const Size(157, 32),
                      backgroundColor: const Color(0xff181C71),
                    ),
                    child: const Text(
                      'استمر في التقدم الآن',
                      style: TextStyle(
                        color: Color(0xFFF9F9F9),
                        fontSize: 13,
                        fontFamily: 'Cairo',
                        fontWeight: FontWeight.w700,
                        height: 0,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
