import 'package:flutter/material.dart';
import 'package:quizzard/components/my_quiz_tile.dart';
import 'package:quizzard/controller/datarepo.dart';
import 'package:quizzard/model/quiz.dart';

class StartQuiz extends StatelessWidget {
  StartQuiz({super.key});
  final List<Quiz> quizList = DataRepository.quizList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Quizzard! // start quiz",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
                itemCount: quizList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: Column(
                      children: [
                        MyQuiz(
                          quiz: quizList[index],
                          typeQuiz: int.parse(quizList[index].type),
                        ),
                        Text(quizList[index].questionTable.toString()),
                      ],
                    ),
                  );
                }),
          )
        ],
      ),
    );
  }
}
