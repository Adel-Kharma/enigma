import 'dart:math';

import 'package:enigma/classes/wisdom.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/HomePage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static List<String> lessonList = [];
  static String wisdom = '';

  const MyApp({super.key});

  // This widget is the root of your application.

  void initLessons() async {
    for (int i = 0; i < 7; i++) {
      await rootBundle
          .loadString('assets/texts/lesson${i + 1}.xml')
          .then((value) => MyApp.lessonList.add(value));
    }

    for (int i = 13; i < 16; i++) {
      await rootBundle
          .loadString('assets/texts/lesson${i}.xml')
          .then((value) => MyApp.lessonList.add(value));
    }
  }

  @override
  Widget build(BuildContext context) {
    initLessons();
    wisdom = Wisdom.getWise();
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF9F9F9),
        systemNavigationBarColor: Color(0xFFF9F9F9),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enigma',
      localizationsDelegates: const [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: const [
        Locale('ar', 'AE'),
        Locale('en', 'US'),
      ],
      locale: const Locale('ar', 'AE'),
      home: HomePage(),
    );
  }
}
