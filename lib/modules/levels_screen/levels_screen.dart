import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../shared/components/components.dart';
import '../NumBackground.dart';

class LevelsScreen extends StatelessWidget {
  const LevelsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff03A9F4),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_ios_sharp,
              color: Color(0xffF9F9F9),
            )),
        centerTitle: true,
        title: const Text(
          'مرحبا  اسم المستخدم',
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
            searchBar(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                roundedButton(
                    text: 'تم الإكمال',
                    textColor: const Color(0xff181C71),
                    backgroundColor: const Color(0xffF9F9F9)),
                const SizedBox(
                  width: 8,
                ),
                roundedButton(
                    text: 'قيد الممارسة',
                    textColor: const Color(0xff181C71),
                    backgroundColor: const Color(0xffF9F9F9)),
                const SizedBox(
                  width: 8,
                ),
                roundedButton(
                    text: 'مستويات',
                    textColor: const Color(0xffF9F9F9),
                    backgroundColor: const Color(0xff181C71)),
              ],
            ),
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
            levelsCard(text: 'المستوى الأوّل', isOpened: true),
            levelsCard(text: 'المستوى الثاني', isOpened: false),
            levelsCard(text: 'المستوى الثالث', isOpened: false),
          ],
        ),
      ),
    );
  }
}
