import 'package:flutter/material.dart';
import 'package:quizzard/model/quiz.dart';
import 'package:quizzard/pages/startQuiz_page.dart';

class PlayQuizPage extends StatelessWidget {
  Quiz quiz;
  PlayQuizPage({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return quiz.type == "3"
        ? Scaffold(
            backgroundColor: const Color.fromARGB(255, 230, 244, 253),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                "Let's Quiz",
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            body: SingleChildScrollView(
              child: StartQuiz(quiz: quiz),
            ),
          )
        : Scaffold(
            backgroundColor: const Color.fromARGB(255, 230, 244, 253),
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              title: const Text(
                "Let's Quiz",
                style: TextStyle(fontWeight: FontWeight.w900),
              ),
            ),
            body: StartQuiz(quiz: quiz),
          );
  }
}
