import 'package:quizzard/model/topic.dart';

class Subtopic {
  late Topic topic;
  String subtopicName;
  String description;
  String references;
  String isBookmarked;
  late bool bookmarked;

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

  void setBookmarked(bool b) {
    bookmarked = b;
  }

  Topic get getTopic => topic;
  String get getSubtopicName => subtopicName;
  String get getDescription => description;
  String get getReferences => references;
  bool get getBookmarked {
    if (isBookmarked == "TRUE") {
      bookmarked = true;
    } else {
      bookmarked = false;
    }
    return bookmarked;
  }

  bool get getIsBookmarked {
    if (isBookmarked == "TRUE") {
      bookmarked = true;
      return true;
    } else {
      bookmarked = false;
      return false;
    }
  }
}
