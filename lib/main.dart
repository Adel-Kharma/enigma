import 'package:enigma/modules/onboarding_screen/onboarding_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/HomePage.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

void main() {
  runApp(const MyApp());
}

void initLessons() async {
  await rootBundle
      .loadString('assets/texts/lesson1.xml')
      .then((value) => MyApp.roro = value);
  print('object==============');
  print(MyApp.roro);
}

class MyApp extends StatelessWidget {
  static String roro = '';

  const MyApp({super.key});

  // This widget is the root of your application.

  void initLessons() async {
    await rootBundle
        .loadString('assets/texts/lesson1.xml')
        .then((value) => MyApp.roro = value);
  }

  @override
  Widget build(BuildContext context) {
    initLessons();
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.white,
        systemNavigationBarColor: Colors.white,
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
      ],
      locale: const Locale('ar', 'AE'),
      home: HomePage(),
    );
  }
}
