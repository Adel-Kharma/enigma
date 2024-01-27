// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:math';

import 'package:enigma/modules/educational_screens/educational_screens.dart';
import 'package:enigma/screens/quotes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Random random = Random();
String randomString = quotes[Random().nextInt(quotes.length)];

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(textScaler: TextScaler.linear(1.0)),
      child: Scaffold(
        backgroundColor: Color(0xff4aa1ff),
        //appBar: AppBar(),
        body: SafeArea(
          child: CustomScrollView(slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: Column(
                children: [
                  //intro
                  Padding(
                    padding: const EdgeInsets.only(top: 2, right: 16, left: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Column(
                          //mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 60,
                              width: 220,
                              child: Text(
                                'مرحباً بك في Enigma',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 26,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w800,
                                  height: 0,
                                  letterSpacing: -1.20,
                                ),
                                overflow: TextOverflow.ellipsis,
                                maxLines: 1,
                              ),
                            ),
                            SizedBox(height: 8),
                            SizedBox(
                              width: 180,
                              child: Text(
                                'من سلك طريقًا يلتمس فيه علماً سهل الله له به طريقًا إلى الجنة',
                                textAlign: TextAlign.right,
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 13,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w700,
                                  height: 0,
                                  letterSpacing: -0.39,
                                ),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                        SvgPicture.asset(
                          'assets/images/illustration/girlstudying.svg',
                          height: 130,
                          allowDrawingOutsideViewBox: true,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Expanded(
                    child: Container(
                      width: double.infinity,
                      decoration: ShapeDecoration(
                        color: Color(0xFFF9F9F9),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(16),
                            topRight: Radius.circular(16),
                          ),
                        ),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 16,
                          ),
                          //offer
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 16.0, right: 16, left: 16),
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                Container(
                                  clipBehavior: Clip.antiAlias,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.only(
                                        topLeft: Radius.circular(16),
                                        bottomRight: Radius.circular(16),
                                      ),
                                      color: Colors.transparent,
                                      boxShadow: [
                                        BoxShadow(
                                            color: Color(0x66000000),
                                            blurRadius: 8,
                                            spreadRadius: 0.04,
                                            blurStyle: BlurStyle.normal)
                                      ]),
                                  child: SvgPicture.asset(
                                    'assets/images/offercard.svg',
                                    fit: BoxFit.fill,
                                    width: MediaQuery.of(context).size.width,
                                  ),
                                ),
                                SizedBox(
                                  height: 170,
                                  width: 340,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '#هل_تعلم',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Cairo',
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                      Text(
                                        randomString,
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(
                                        '#طرائف_ومعلومات Engima 😁',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontFamily: 'Cairo',
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                          OptionSelector(
                              title: 'القسم التعليمي',
                              desc:
                                  'هنا ستتعلم كل ما يخص مادة الاحتمالات بالإضافة إلى تمارين تدريبية واختبارات لتقيس مدى تقدمك',
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EducationalScreens()));
                              },
                              svgPath: 'assets/images/learning.svg'),
                          OptionSelector(
                              title: 'الإعدادات',
                              desc:
                                  'هنا نكتب ما تتضمنه هذه الواجهة من إعدادات أو معلومات رئيسية في هذا القسم يعني',
                              onTap: () => showGeneralDialog(context: context, pageBuilder: (context, animation1, animation2)
                              {
                                return Container();
                              },
                                  //barrierDismissible: true,
                                  //barrierLabel: '',
                                  //transitionDuration: const Duration(microseconds: 400),
                                  transitionBuilder: (context, a1, a2, widget){
                                    return ScaleTransition(
                                      scale: Tween<double>(begin:  0.5, end: 1).animate(a1),
                                      child: FadeTransition(
                                        opacity: Tween<double>(begin:  0.5, end: 1).animate(a1),
                                        child: AlertDialog(
                                          backgroundColor:
                                          const Color(0xFFF9F9F9),
                                          shape: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius:
                                              BorderRadius.circular(
                                                  16)),
                                          content: SizedBox(
                                            height: 137,
                                            child: Center(
                                                child: Text(
                                                  'قريباً...',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                    color: Color(0xFF4B54FF),
                                                    fontSize: 24,
                                                    fontFamily: 'Jost',
                                                    fontWeight: FontWeight.w600,
                                                    height: 0,
                                                  ),
                                                )
                                            ),
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                              ),
                              svgPath: 'assets/images/setting.svg'),
                          SizedBox(
                            height: 20,
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }
}

class OptionSelector extends StatelessWidget {
  const OptionSelector({
    super.key,
    required this.onTap,
    required this.title,
    required this.desc,
    required this.svgPath,
  });

  final Function onTap;
  final String title;
  final String desc;
  final String svgPath;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onTap(),
      child: Padding(
        padding: const EdgeInsets.only(top: 32.0, right: 16, left: 16),
        child: Stack(
          alignment: Alignment.center,
          children: [
            Divider(
              thickness: 8,
              color: const Color(0xff0961F5),
              indent: 2,
              endIndent: 2,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Stack(
                  alignment: Alignment.center,
                  children: [
                    SvgPicture.asset(
                      'assets/images/polygon.svg',
                      fit: BoxFit.fill,
                      width: MediaQuery.of(context).size.width / 1.4,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.8,
                      child: Column(
                        children: [
                          Text(
                            title,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Text(
                            desc,
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.75),
                              fontSize: 13,
                              fontFamily: 'Cairo',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.30,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  width: 64.44,
                  height: 64.44,
                  decoration: ShapeDecoration(
                    gradient: LinearGradient(
                      begin: Alignment(1.00, -0.01),
                      end: Alignment(-1, 0.01),
                      colors: [Color(0xFF6B73FF), Color(0xFF0961F5)],
                    ),
                    shape: OvalBorder(),
                  ),
                  child: Center(
                    child: SvgPicture.asset(
                      svgPath,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
