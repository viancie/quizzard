import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:quizzard/components/dialog_create.dart';
import 'package:quizzard/components/my_quiz_tile.dart';
import 'package:quizzard/components/topic_button.dart';
import 'package:quizzard/controller/datarepo.dart';
import 'package:quizzard/model/questions.dart';
import 'package:quizzard/model/quiz.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  final TextEditingController _controller = TextEditingController();
  int selected = -1;

  List<Quiz> tryTheseQuizzes = DataRepository.quizList;

  void saveQuiz() {
    setState(() {
      HashMap<Question, String> hTable = HashMap();
      DataRepository.myQuizList
          .add(Quiz(_controller.text, selected.toString(), hTable));
      _controller.clear();
    });
    Navigator.pop(context);
  }

  void removeQuiz(int index) {
    setState(() {
      DataRepository.myQuizList.removeAt(index);
    });
    Navigator.pop(context);
  }

  void showWarning(int index) {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color(0xFFE6F4FD),
            content: Padding(
              padding: const EdgeInsets.only(top: 18, bottom: 18),
              child: Container(
                  height: 78,
                  child: Column(
                    children: [
                      const Center(
                        child: Text(
                          "Do you want to delete this quiz?",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.w500),
                        ),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                            onTap: () => removeQuiz(index),
                            child: Container(
                                height: 40,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19),
                                  color: Color(0xFFE3623C),
                                ),
                                child: const Center(
                                  child: Text(
                                    "Yes",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.pop(context),
                            child: Container(
                                height: 40,
                                width: 110,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(19),
                                  color: Colors.white,
                                ),
                                child: const Center(
                                  child: Text(
                                    "No",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w700),
                                  ),
                                )),
                          ),
                        ],
                      )
                    ],
                  )),
            ),
          );
        });
  }

  void createMCQuiz() {
    setState(() {
      selected = 1;
    });

    showDialog(
        context: context,
        builder: (context) {
          return CreateQuiz(
            type: 1,
            controller: _controller,
            onCreate: saveQuiz,
            onCancel: () => Navigator.pop(context),
          );
        });
  }

  void createTFQuiz() {
    setState(() {
      selected = 2;
    });

    showDialog(
        context: context,
        builder: (context) {
          return CreateQuiz(
            type: 2,
            controller: _controller,
            onCreate: saveQuiz,
            onCancel: () => Navigator.pop(context),
          );
        });
  }

  void createBlanksQuiz() {
    setState(() {
      selected = 3;
    });

    showDialog(
        context: context,
        builder: (context) {
          return CreateQuiz(
            type: 3,
            controller: _controller,
            onCreate: saveQuiz,
            onCancel: () => Navigator.pop(context),
          );
        });
  }

  void createCardsQuiz() {
    setState(() {
      selected = 4;
    });

    showDialog(
        context: context,
        builder: (context) {
          return CreateQuiz(
            type: 4,
            controller: _controller,
            onCreate: saveQuiz,
            onCancel: () => Navigator.pop(context),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Quizzard!",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 630,
          child: Padding(
            padding: const EdgeInsets.only(right: 24, left: 24),
            child: Column(children: [
              const SizedBox(height: 20),
              // text create quiz
              const Align(
                alignment: Alignment.topLeft,
                child: Text("Create Quiz",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                    )),
              ),
              const SizedBox(height: 20),
              // buttons for type of quiz
              Row(
                children: [
                  TopicButton(
                    isClicked: false,
                    onTap: createMCQuiz,
                    iconDefaultPath: "lib/assets/multiple_choice.svg",
                    iconPressedPath: "lib/assets/multiple_choice.svg",
                    text: "Choices",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TopicButton(
                    isClicked: false,
                    onTap: createTFQuiz,
                    iconDefaultPath: "lib/assets/true_false.svg",
                    iconPressedPath: "lib/assets/true_false.svg",
                    text: "True or False",
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  TopicButton(
                    isClicked: false,
                    onTap: createBlanksQuiz,
                    iconDefaultPath: "lib/assets/fill_blanks.svg",
                    iconPressedPath: "lib/assets/fill_blanks.svg",
                    text: "Fill in Blanks",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TopicButton(
                    isClicked: false,
                    onTap: createCardsQuiz,
                    iconDefaultPath: "lib/assets/flash_cards.svg",
                    iconPressedPath: "lib/assets/flash_cards.svg",
                    text: "Flashcards",
                  )
                ],
              ),

              const SizedBox(height: 30),
              // my quizzes text
              const Align(
                alignment: Alignment.topLeft,
                child: Text("My Quizzes",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                    )),
              ),

              const SizedBox(
                height: 10,
              ),
              // list of quizzes
              DataRepository.myQuizList.isEmpty
                  ? const Padding(
                      padding: EdgeInsets.all(20),
                      child: Text("You haven't created any quizzes.",
                          style: TextStyle(
                              fontStyle: FontStyle.italic,
                              fontSize: 18,
                              fontWeight: FontWeight.normal)),
                    )
                  : SizedBox(
                      height: 151,
                      child: ListView.builder(
                          itemCount: DataRepository.myQuizList.length,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            return GestureDetector(
                                onLongPress: () => showWarning(index),
                                child: MyQuiz(
                                    quiz: DataRepository.myQuizList[index],
                                    typeQuiz: 0));
                          }),
                    ),
              const SizedBox(
                height: 10,
              ),
              // try these! text
              const Align(
                alignment: Alignment.topLeft,
                child: Text("Try These!",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 25,
                    )),
              ),
              const SizedBox(
                height: 10,
              ),

              // list of built in quizzes
              SizedBox(
                height: 151,
                child: ListView.builder(
                    itemCount: tryTheseQuizzes.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (cont, ind) {
                      return MyQuiz(quiz: tryTheseQuizzes[ind], typeQuiz: -1);
                    }),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
