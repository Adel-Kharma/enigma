import 'dart:io';

import 'package:enigma/main.dart';
//import 'package:path_provider/path_provider.dart';

import 'Page.dart';
import 'Practice.dart';
import 'Topic.dart';
import 'package:xml/xml.dart';

class LessonReader {
  int lessonNum;
  late File file;
  var document;
  String title = '', prcTitle = '';
  String? no;

  LessonReader(this.lessonNum) {
    //file = File('packages:enigma/assets/texts/lesson1.xml');

    document = XmlDocument.parse(MyApp.lessonList[lessonNum - 1]);
    title = document.children[0].getAttribute('title');
    prcTitle = document.children[0].getAttribute('prc-title');

//
  }

  /*
  Future<File> getFileFromAssets(String path) async {
    final byteData = await rootBundle.load('assets/$path');
    final buffer = byteData.buffer;
    Directory tempDir = await getTemporaryDirectory();
    String tempPath = tempDir.path;
    var filePath = tempPath + '/file_01.tmp';
    // file_01.tmp is dump file, can be anything
    return File(filePath).writeAsBytes(
        buffer.asUint8List(byteData.offsetInBytes, byteData.lengthInBytes));
  }*/

  List<Topic> getTopics() {
    List<Topic> list = [];
    int count = document.children[0].getElement('topics')?.childElements.length;
    for (int i = 0; i < count; i++) {
      list.add(Topic(
          document.children[0]
              .getElement('topics')
              ?.childElements
              .elementAt(i)
              .text,
          document.children[0]
              .getElement('topics')
              ?.childElements
              .elementAt(i)
              .getAttribute('des')));
    }
    return list;
  }

  List<Page> getPages() {
    List<Page> list = [];
    int count = document.children[0].getElement('pages')?.childElements.length;
    for (int i = 0; i < count; i++) {
      list.add(Page(document.children[0]
          .getElement('pages')!
          .childElements
          .elementAt(i)
          .toString()));
    }
    return list;
  }

  List<Practice> getPractices() {
    List<Practice> list = [];
    int count =
        document.children[0].getElement('practices')?.childElements.length;
    for (int i = 0; i < count; i++) {
      list.add(Practice(document.children[0]
          .getElement('practices')!
          .childElements
          .elementAt(i)
          .toString()));
    }
    return list;
  }
}
