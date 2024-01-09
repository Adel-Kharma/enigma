import 'package:enigma/classes/level_progress.dart';
import 'package:enigma/screens/widgets/opened_section_card.dart';
import 'package:flutter/cupertino.dart';

class Topic {
  String _title;
  String _desc;

  Topic(this._title, this._desc);

  String get desc => _desc;

  set desc(String value) {
    _desc = value;
  }

  String get title => _title;

  set title(String value) {
    _title = value;
  }

  Widget getTopics() {
    return LevelContentItem(
      levelState: LevelState.Undone,
      title: _title,
      desc: desc,
    );
  }
}
