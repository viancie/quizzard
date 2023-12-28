import 'package:quizzard/model/topic.dart';

class Subtopic {
  late Topic topic;
  String subtopicName;
  String description;
  String references;
  String isBookmarked;

  Subtopic(
      {required this.subtopicName,
      required this.description,
      required this.references,
      required this.isBookmarked});

  void setTopic(Topic t) {
    topic = t;
  }

  void setSubtopicName(String s) {
    subtopicName = s;
  }

  void setDescription(String d) {
    description = d;
  }

  void setReferences(String r) {
    references = r;
  }

  void setIsBookmarked(String b) {
    isBookmarked = b;
  }

  Topic get getTopic => topic;
  String get getSubtopicName => subtopicName;
  String get getDescription => description;
  String get getReferences => references;
  bool get getIsBookmarked {
    if (isBookmarked == "TRUE") {
      return true;
    } else {
      return false;
    }
  }
}
