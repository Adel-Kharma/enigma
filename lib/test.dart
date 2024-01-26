import 'package:xml/xml.dart';
import 'dart:io';

void main() {
  final file = File('./assets/texts/lesson2.xml');
  /*ByteData bytes = rootBundle.load(key)
      */
  print(file.readAsString());
  final document = XmlDocument.parse(file.readAsStringSync());
  /*print(document.children[0]
      .getElement('pages')
      ?.childElements
      .elementAt(4)
      .getAttribute("reorder"));*/
  print(document.children[0]
      .getElement('pages')
      ?.childElements
      .elementAt(1)
      .childElements
      .elementAt(0)
      .childElements
      .elementAt(0));
  int? count = document.children[0].getElement('pages')?.childElements.length;
  /*for (int i = 0; i < count!; i++) {
    print(document.children[0]
        .getElement('pages')
        ?.childElements
        .elementAt(i)
        .toString());
  }*/
  print(document.rootElement.name);

  //print(document.children[0].childElements.elementAt(3).getAttribute('src'));
}
