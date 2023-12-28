import 'dart:collection';

import 'package:quizzard/model/questions.dart';

class Quiz {
  late String title;
  late String type; // 1 - choices, 2 - TF, 3 - Blanks, 4 - Cards
  late HashMap<Question, String> questionTable;

  // constructor
  Quiz(String t, String ty, HashMap<Question, String> q) {
    title = t;
    type = ty;
    questionTable = q;
  }

  Quiz.onlyTitle(String t) {
    title = t;
    type = "0";
    questionTable = HashMap();
  }
  void setType(int t) {
    type = "0";
  }

  void addQuestionTable(HashMap<Question, String> qt) {
    questionTable = qt;
  }

  // method to add question to quiz
  void addQuestion(Question q, String answer) {
    questionTable.addAll({q: answer});
  }
}
