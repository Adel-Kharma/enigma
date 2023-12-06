// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:enigma/modules/NumBackground.dart';
import 'package:enigma/screens/LevelSpecifierScreeen.dart';
import 'package:enigma/screens/widgets/item_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:gradient_widgets/gradient_widgets.dart';

class HomePage extends StatelessWidget {
  var controller = PageController(viewportFraction: 0.5, keepPage: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(),
      body: SafeArea(
        child: Stack(children: [
          Positioned(
            bottom: 0,
            child: Container(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              color: const Color(0xFFF9F9F9),
              child: const Center(
                child: Text(''),
              ),
            ),
          ),
          NumBackground(
            child: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        //intro
                        Padding(
                          padding:
                              const EdgeInsets.only(top: 2, right: 16, left: 8),
                          child: Row(
                            children: [
                              const Column(
                                //mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'مرحبا  اسم المستخدم',
                                    style: TextStyle(
                                      color: Color(0xFFF9F9F9),
                                      fontSize: 24,
                                      fontFamily: 'Cairo',
                                      fontWeight: FontWeight.w800,
                                      height: 0,
                                      letterSpacing: -1.20,
                                    ),
                                  ),
                                  const SizedBox(height: 8),
                                  SizedBox(
                                    width: 210,
                                    child: Text(
                                      'نص تحفيزي يحقز المستخدم عند دخوله لهذا التطبيق ',
                                      textAlign: TextAlign.right,
                                      style: TextStyle(
                                        color: Color(0xFFF9F9F9),
                                        fontSize: 13,
                                        fontFamily: 'Cairo',
                                        fontWeight: FontWeight.w700,
                                        height: 0,
                                        letterSpacing: -0.39,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              Expanded(
                                child: SvgPicture.asset(
                                  'assets/images/illustration/girlstudying.svg',
                                  //height: 220,
                                  allowDrawingOutsideViewBox: true,
                                  //fit: BoxFit.fitWidth,
                                ),
                              )
                            ],
                          ),
                        ),
                        Stack(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 60.0),
                              child: Container(
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
                                      height: 48,
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
                                                borderRadius:
                                                    BorderRadius.circular(16),
                                                color: Colors.transparent,
                                                boxShadow: [
                                                  BoxShadow(
                                                      color: Color(0x66000000),
                                                      blurRadius: 8,
                                                      spreadRadius: 0.04,
                                                      blurStyle:
                                                          BlurStyle.normal)
                                                ]),
                                            child: SvgPicture.asset(
                                              'assets/images/offercard.svg',
                                              fit: BoxFit.fill,
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                            ),
                                          ),
                                          Text(
                                            'فارغ حاليا',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 20,
                                              fontFamily: 'Cairo',
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                    //text
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child: Text(
                                        'قمت به مؤخرا',
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                          color: Color(0xFF181C71),
                                          fontSize: 20,
                                          fontFamily: 'Cairo',
                                          fontWeight: FontWeight.w800,
                                          height: 0,
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 282,
                                      child: PageView(
                                        padEnds: false,
                                        controller: controller,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                right: 8.0, left: 8.0),
                                            child: ItemCard(
                                                imagePath:
                                                    'assets/images/background.png',
                                                category: "title",
                                                title: "category",
                                                onTap: () {}),
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 70,
                                    )
                                  ],
                                ),
                              ),
                            ),

                            //progress
                            Padding(
                              padding: const EdgeInsets.only(
                                  right: 16.0, left: 16, top: 8),
                              child: Card(
                                elevation: 4,
                                shadowColor: Color(0x69000000),
                                margin: EdgeInsets.zero,
                                shape: RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(16)),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.stretch,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            'مقدار ما تعلمته اليوم',
                                            style: TextStyle(
                                              color: Color(0xFF858597),
                                              fontSize: 12,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                          InkWell(
                                            highlightColor: Colors.cyan,
                                            onTap: () {
                                              //to the new screen
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LevelSpecifierScreen()));
                                            },
                                            child: Text(
                                              'تعديل الخطة',
                                              style: TextStyle(
                                                  shadows: [
                                                    Shadow(
                                                        color:
                                                            Color(0xFF03A9F4),
                                                        offset: Offset(0, -5))
                                                  ],
                                                  color: Colors.transparent,
                                                  fontSize: 12,
                                                  fontFamily: 'Cairo',
                                                  fontWeight: FontWeight.w400,
                                                  height: 0,
                                                  decoration:
                                                      TextDecoration.underline,
                                                  decorationColor:
                                                      Color(0xFF03A9F4)),
                                            ),
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 4,
                                      ),
                                      Row(
                                        textBaseline: TextBaseline.alphabetic,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.baseline,
                                        children: [
                                          Text(
                                            '60min /',
                                            style: TextStyle(
                                              color: Color(0xFF858597),
                                              fontSize: 10,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w400,
                                              height: 0,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                            '46min',
                                            style: TextStyle(
                                              color: Color(0xFF1F1F39),
                                              fontSize: 20,
                                              fontFamily: 'Poppins',
                                              fontWeight: FontWeight.w700,
                                              height: 0,
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 8,
                                      ),
                                      Container(
                                        clipBehavior: Clip.antiAlias,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(1000)),
                                        ),
                                        child: GradientProgressIndicator(
                                          value: 46 / 60,
                                          gradient: LinearGradient(
                                            begin: Alignment.centerRight,
                                            end: Alignment.centerLeft,
                                            colors: [
                                              //Colors.amber,
                                              Color(0xFFF4F3FD),
                                              Color(0xFF06FF1F),
                                            ],
                                            //stops: [1.0, 0.0],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ]),
      ),
    );
  }
}
