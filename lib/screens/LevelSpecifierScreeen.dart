// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'widgets/level_specifier_top_bar.dart';

class LevelSpecifierScreen extends StatelessWidget {
  const LevelSpecifierScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          Container(
            color: Color(0x800961f5),
            child: Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: SvgPicture.asset(
                'assets/images/offercard.svg',
                height: 300,
                allowDrawingOutsideViewBox: true,
                fit: BoxFit.fill,
              ),
            ),
          ),
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
          CustomScrollView(slivers: [
            SliverFillRemaining(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(top: 82, right: 16, left: 8),
                      child: Row(
                        //crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Column(
                            //mainAxisSize: MainAxisSize.min,
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'المستوى الأوّل',
                                style: TextStyle(
                                  color: Color(0xFFF9F9F9),
                                  fontSize: 24,
                                  fontFamily: 'Cairo',
                                  fontWeight: FontWeight.w800,
                                  height: 0,
                                  letterSpacing: -1.20,
                                ),
                              ),
                              SizedBox(height: 8),
                              SizedBox(
                                width: 210,
                                child: Text(
                                  'نص تحفيزي يحفز المستخدم عند دخوله لهذا المستوى',
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
                            flex: 10,
                            child: SvgPicture.asset(
                              'assets/images/illustration/teamcollabrating.svg',
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
                          padding: const EdgeInsets.only(top: 36.0),
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
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 24.0, right: 16, left: 16),
                                  child: Stack(
                                    alignment: Alignment.center,
                                    children: [
                                      //____________________________________________________
                                      SizedBox(
                                        //width: 358,

                                        child: Stack(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                  .size
                                                  .width,
                                              decoration: ShapeDecoration(
                                                gradient: LinearGradient(
                                                  begin: Alignment(0.86, 0.51),
                                                  end: Alignment(-0.86, -0.51),
                                                  colors: [
                                                    Color(0xFF1A6EFC),
                                                    Color(0xCC0961F5)
                                                  ],
                                                ),
                                                shape: RoundedRectangleBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(16),
                                                ),
                                              ),
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                        right: 44.0, top: 4),
                                                    child: Text(
                                                      'أساسيات الاحتمالات',
                                                      textAlign:
                                                          TextAlign.right,
                                                      style: TextStyle(
                                                        color:
                                                            Color(0xFFE9E9E9),
                                                        fontSize: 16,
                                                        fontFamily: 'Cairo',
                                                        fontWeight:
                                                            FontWeight.w800,
                                                        height: 0,
                                                        letterSpacing: -0.48,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 44.0,
                                                            left: 32.0),
                                                    child: Divider(
                                                        height: 20,
                                                        thickness: 2,
                                                        color:
                                                            Color(0x80E0E0E0)),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            right: 44.0),
                                                    child: Column(
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 4.0),
                                                          child: SizedBox(
                                                            height: 45,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              textBaseline:
                                                                  TextBaseline
                                                                      .ideographic,
                                                              children: [
                                                                Text(
                                                                  'ما هي الاحتمالات؟',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    height: 0,
                                                                    letterSpacing:
                                                                        -0.39,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'يمكنك أن تولد مثل هذا النص أو العديد من النصوص',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0x7FF9F9F9),
                                                                    fontSize:
                                                                        10,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 4.0),
                                                          child: SizedBox(
                                                            height: 45,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              textBaseline:
                                                                  TextBaseline
                                                                      .ideographic,
                                                              children: [
                                                                Text(
                                                                  'ما هي الاحتمالات؟',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    height: 0,
                                                                    letterSpacing:
                                                                        -0.39,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'يمكنك أن تولد مثل هذا النص أو العديد من النصوص',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0x7FF9F9F9),
                                                                    fontSize:
                                                                        10,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 4.0),
                                                          child: SizedBox(
                                                            height: 45,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              textBaseline:
                                                                  TextBaseline
                                                                      .ideographic,
                                                              children: [
                                                                Text(
                                                                  'ما هي الاحتمالات؟',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    height: 0,
                                                                    letterSpacing:
                                                                        -0.39,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'يمكنك أن تولد مثل هذا النص أو العديد من النصوص',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0x7FF9F9F9),
                                                                    fontSize:
                                                                        10,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        Padding(
                                                          padding:
                                                              const EdgeInsets
                                                                  .only(
                                                                  bottom: 4.0),
                                                          child: SizedBox(
                                                            height: 45,
                                                            child: Column(
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .start,
                                                              textBaseline:
                                                                  TextBaseline
                                                                      .ideographic,
                                                              children: [
                                                                Text(
                                                                  'ما هي الاحتمالات؟',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Colors
                                                                        .white,
                                                                    fontSize:
                                                                        13,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w700,
                                                                    height: 0,
                                                                    letterSpacing:
                                                                        -0.39,
                                                                  ),
                                                                ),
                                                                Text(
                                                                  'يمكنك أن تولد مثل هذا النص أو العديد من النصوص',
                                                                  textAlign:
                                                                      TextAlign
                                                                          .right,
                                                                  style:
                                                                      TextStyle(
                                                                    color: Color(
                                                                        0x7FF9F9F9),
                                                                    fontSize:
                                                                        10,
                                                                    fontFamily:
                                                                        'Cairo',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .w400,
                                                                    height: 0,
                                                                  ),
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(height: 4.0),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                      //___________________________________________________
                                    ],
                                  ),
                                ),
                                //text
                              ],
                            ),
                          ),
                        ),

                        //progress
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ]),
          LevelSpecifierTopBar(
            index: 0,
          ),
        ],
      )),
    );
  }
}
