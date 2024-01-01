import 'package:enigma/modules/NumBackground.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';

import '../../shared/components/components.dart';

class DoneScreen extends StatelessWidget {
  const DoneScreen({super.key});

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
                    textColor: const Color(0xffF9F9F9),
                    backgroundColor: const Color(0xff181C71)),
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
                    textColor: const Color(0xff181C71),
                    backgroundColor: const Color(0xffF9F9F9)),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: double.infinity,
                decoration: const BoxDecoration(
                    color: Color(0xffF9F9F9),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(16),
                        topRight: Radius.circular(16))),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 31,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const SizedBox(
                            width: 220,
                            child: Text(
                              'عبارة تخبر المستخدم بتقدمه الجيد أو السيء الذي يحرزه في التعلم والإنجاز',
                              style: TextStyle(
                                  color: Color(0xff181C71),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  fontFamily: 'Cairo'),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          SizedBox(
                            width: 100,
                            child: CircularPercentIndicator(
                              radius: 45.0,
                              lineWidth: 10.0,
                              animation: true,
                              percent: 0.7,
                              center: const Text(
                                "70%",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18.0,
                                    fontFamily: 'Montserrat'),
                              ),
                              circularStrokeCap: CircularStrokeCap.round,
                              progressColor: const Color(0xff06FF1F),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 28,
                      ),
                      doneCard(
                          color: Colors.blue,
                          image: 'assets/images/done_screen_test_image.svg',
                          stars: 3,
                          title: 'عبارة وصفية',
                          subtitle:
                              'هنا نخبر المستخدم باسم الشيء المنجز والوقت الذي استغرقه لهذا الأمر')
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
