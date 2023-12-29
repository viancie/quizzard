import 'dart:collection';
import 'dart:math';

import 'package:csv/csv.dart';
import 'package:flutter/services.dart';
import 'package:quizzard/model/questions.dart';
import 'package:quizzard/model/quiz.dart';
import 'package:quizzard/model/subtopic.dart';
import 'package:quizzard/model/topic.dart';

class DataRepository {
  static final List<Topic> _topicList = [];
  static final List<Topic> _favoriteList = [];
  static final List<Quiz> _quizList = [];
  static List<Topic> _popularList = [];
  static List<Topic> _newestList = [];
  static final List<Subtopic> _bookmarkList = [];
  static final List<Quiz> _myQuizList = [];

  static Future<void> loadData() async {
    //loading topic data
    String raw = await rootBundle.loadString('lib/files/topic_data.tsv');
    List<List<dynamic>> lines =
        const CsvToListConverter(fieldDelimiter: '\t').convert(raw);

    for (int i = 1; i < lines.length; i++) {
      String topicName = lines[i][0];
      String descrip = lines[i][1];
      String isLiked = lines[i][2];
      Topic t = Topic(
        topicName: topicName,
        description: descrip,
        isLiked: isLiked,
      );
      if (t.getIsLiked) {
        _favoriteList.add(t);
      }
      _topicList.add(t);
    }

    _popularList = randomizer();
    _newestList = randomizer();

    //loading subtopic data
    raw = await rootBundle.loadString('lib/files/subtopic_data.tsv');
    lines = const CsvToListConverter(fieldDelimiter: '\t').convert(raw);

    String tn = lines[1][0];
    List<Subtopic> subtopicList = [];
    for (int i = 1; i < lines.length; i++) {
      String topicName = lines[i][0];
      String subtopicName = lines[i][1];
      String descrip = lines[i][2];
      String ref = lines[i][3];
      String b = lines[i][4];
      Subtopic subtopic = Subtopic(
          subtopicName: subtopicName,
          description: descrip,
          references: ref,
          isBookmarked: b);

      if (tn != topicName) {
        List<Topic> result = _topicList
            .where(
              (element) => element.getTopicName == tn,
            )
            .toList();
        result[0].setSubtopics(subtopicList);
        tn = topicName;
        subtopicList = [];
        i--;
      } else {
        subtopicList.add(subtopic);
        subtopic.setTopic(_topicList
            .where(
              (element) => element.getTopicName == tn,
            )
            .toList()[0]);
        if (subtopic.getIsBookmarked) {
          _bookmarkList.add(subtopic);
        }
      }
    }
    List<Topic> result = _topicList
        .where(
          (element) => element.getTopicName == tn,
        )
        .toList();
    result[0].setSubtopics(subtopicList);

    //loading quiz data
    raw = await rootBundle.loadString('lib/files/quiz_data.tsv');
    lines = const CsvToListConverter(fieldDelimiter: '\t').convert(raw);

    String title = lines[1][0];
    int type = lines[1][1].toInt();
    Quiz quiz = Quiz.onlyTitle(title);
    quiz.setType(type);
    HashMap<Question, String> questionTable = HashMap();

    for (int i = 1; i < lines.length; i++) {
      String title1 = lines[i][0];
      int type1 = lines[i][1].toInt();

      if (title == title1 && type == type1) {
        String a = lines[i][4];
        String b = lines[i][5];
        String c = lines[i][6];
        String d = lines[i][7];
        String answer = lines[i][3].toString();

        Question q;
        if (type == 1) {
          q = Question(lines[i][2], ["A) $a", "B) $b", "C) $c", "D) $d"]);
          if (answer == "A") {
            answer = "A) $a";
          } else if (answer == "B") {
            answer = "B) $b";
          } else if (answer == "C") {
            answer = "C) $c";
          } else if (answer == "D") {
            answer = "D) $d";
          }
        } else if (type == 2) {
          q = Question(lines[i][2], ["TRUE", "FALSE"]);
        } else {
          q = Question.noChoices(lines[i][2]);
        }
        final quizEntry = {q: answer};
        questionTable.addEntries(quizEntry.entries);
      } else {
        quiz.addQuestionTable(questionTable);
        _quizList.add(quiz);

        //reset
        questionTable = HashMap();
        title = title1;
        type = type1;
        quiz = Quiz.onlyTitle(title);
        quiz.setType(type);
        i--;
      }
    }
    quiz.addQuestionTable(questionTable);
    _quizList.add(quiz);
  }

  static List<Topic> randomizer() {
    List<Topic> list = [];
    int randomLen = Random().nextInt(topicList.length + 1);
    List<int> randomNum = [];
    for (int i = 0; i < randomLen; i++) {
      int randomIndex = Random().nextInt(topicList.length);
      while (randomNum.contains(randomIndex)) {
        randomIndex = Random().nextInt(topicList.length);
      }
      randomNum.add(randomIndex);
      list.add(topicList[randomIndex]);
    }
    return list;
  }

  static List<Topic> get topicList => _topicList;
  static List<Topic> get popularList => _popularList;
  static List<Topic> get newestList => _newestList;
  static List<Topic> get favoriteList => _favoriteList;
  static List<Subtopic> get bookmarkList => _bookmarkList;
  static List<Quiz> get quizList => _quizList;
  static List<Quiz> get myQuizList => _myQuizList;
}
