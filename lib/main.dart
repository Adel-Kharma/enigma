import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'screens/HomePage.dart';

void main() {
  runApp(const MyApp());
}

void initLessons() async {
  await rootBundle
      .loadString('assets/texts/lesson1.xml')
      .then((value) => MyApp.roro = value);
  if (kDebugMode) {
    print('object==============');
  }
  if (kDebugMode) {
    print(MyApp.roro);
  }
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
      const SystemUiOverlayStyle(
        statusBarColor: Color(0xFFF9F9F9),
        systemNavigationBarColor: Color(0xFFF9F9F9),
        statusBarIconBrightness: Brightness.dark,
        systemNavigationBarIconBrightness: Brightness.dark,
      ),
    );
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Enigma',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('ar', 'AE'),
      ],
      locale: Locale('ar', 'AE'),
      home: HomePage(),
    );
  }
}
