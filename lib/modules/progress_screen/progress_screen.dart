import 'package:flutter/material.dart';

import '../../shared/components/components.dart';
import '../NumBackground.dart';

class ProgressScreen extends StatelessWidget {
  const ProgressScreen({super.key});

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
                    textColor: const Color(0xffF9F9F9),
                    backgroundColor: const Color(0xff181C71)),
                const SizedBox(
                  width: 8,
                ),
                roundedButton(
                    text: 'مستويات',
                    textColor: const Color(0xff181C71),
                    backgroundColor: const Color(0xffF9F9F9)),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: progressCard(
                  title: 'اسم خاص بالتدريب',
                  subtitle: 'منذ ساعتين وخمس دقائق',
                  image: 'assets/images/done_screen_test_image.svg',
                  percent: 0.8,
                  onTap: () {}),
            )
          ],
        ),
      ),
    );
  }
}
