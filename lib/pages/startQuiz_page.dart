import 'package:flutter/material.dart';
import 'package:quizzard/components/my_quiz_tile.dart';
import 'package:quizzard/controller/datarepo.dart';
import 'package:quizzard/model/questions.dart';
import 'package:quizzard/model/quiz.dart';

class StartQuiz extends StatefulWidget {
  Quiz quiz;
  StartQuiz({super.key, required this.quiz});

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  final List<Quiz> quizList = DataRepository.quizList;
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    Iterable<Question> keys = widget.quiz.getQuestionTable.keys;
    List<Question> questionList =
        List<Question>.from(widget.quiz.getQuestionTable.keys);

    for (int i = 0; i < keys.length; i++) {}
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Let's Quiz",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        child: Column(
          children: [
            const SizedBox(height: 20),
            Text(widget.quiz.title,
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 25)),
            const SizedBox(height: 20),
            Text("1/10",
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 22)),
            const SizedBox(height: 20),
            Container(
              padding: const EdgeInsets.all(20),
              height: 350,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0),
                  )
                ],
              ),
              child: Center(
                child: Text(
                  questionList[4].qText,
                  style: TextStyle(fontSize: 17),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: 5,
                itemBuilder: (context, index) {
                  if (index == 4) {
                    return GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: 70,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: Colors.blue,
                          boxShadow: const [
                            BoxShadow(
                              color: Colors.grey,
                              blurRadius: 2.0,
                              spreadRadius: 0.0,
                              offset: Offset(2.0, 2.0),
                            )
                          ],
                        ),
                        child: const Center(
                          child: Text(
                            "Next",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                      ),
                    );
                  }
                  return Column(
                    children: [
                      GestureDetector(
                        child: Container(
                          padding: const EdgeInsets.all(20),
                          height: 70,
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            color: Colors.white,
                            boxShadow: const [
                              BoxShadow(
                                color: Colors.grey,
                                blurRadius: 2.0,
                                spreadRadius: 0.0,
                                offset: Offset(2.0, 2.0),
                              )
                            ],
                          ),
                          child: Text(questionList[counter].choices.toString()),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
