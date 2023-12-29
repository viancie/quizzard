import 'package:quizzard/model/subtopic.dart';

class Topic {
  String topicName;
  String description;
  String isLiked;
  late List<Subtopic> subtopics;
  late bool liked;

  Topic(
      {required this.topicName,
      required this.description,
      required this.isLiked});

  void setTopicName(String t) {
    topicName = t;
  }

  void setDescription(String d) {
    description = d;
  }

  void setIsLiked(String l) {
    isLiked = l;
  }

  void setLiked(bool l) {
    liked = l;
  }

  void setSubtopics(List<Subtopic> s) {
    subtopics = s;
  }

  String get getTopicName => topicName;
  String get getDescription => description;
  List<Subtopic> get getSubtopics => subtopics;
  bool get getIsLiked {
    if (isLiked == "TRUE") {
      liked = true;
      return true;
    } else {
      liked = false;
      return false;
    }
  }

  List<dynamic> get toList {
    List<String> text = [topicName, description, isLiked];
    return text;
  }
}
