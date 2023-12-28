class Question {
  late String qText;
  late List<String> choices;

  // constructor
  Question(String q, List<String> c) {
    qText = q;
    choices = c;
  }

  Question.noChoices(String q) {
    qText = q;
    choices = [];
  }
}