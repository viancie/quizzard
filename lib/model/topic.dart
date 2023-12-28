import 'package:quizzard/model/subtopic.dart';

class Topic {
  String topicName;
  String description;
  String isLiked;
  late List<Subtopic> subtopics;

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

  void setSubtopics(List<Subtopic> s) {
    subtopics = s;
  }

  String get getTopicName => topicName;
  String get getDescription => description;
  List<Subtopic> get getSubtopics => subtopics;
  bool get getIsLiked {
    if (isLiked == "TRUE") {
      return true;
    } else {
      return false;
    }
  }
}
