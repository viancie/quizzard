import 'dart:collection';

import 'package:quizzard/model/questions.dart';

class Quiz {
  late String title;
  late int type; // 1 - choices, 2 - TF, 3 - Blanks, 4 - Cards
  late HashMap<Question, String> questionTable;

  // constructor
  Quiz(String t, int ty, HashMap<Question, String> q) {
    title = t;
    type = ty;
    questionTable = q;
  }

  Quiz.onlyTitle(String t) {
    title = t;
    type = 0;
    questionTable = HashMap();
  }

  // method to add question to quiz
  void addQuestion(Question q, String answer) {
    questionTable.addAll({q: answer});
  }

}
