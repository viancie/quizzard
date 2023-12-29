import 'dart:async';

import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:quizzard/components/question_card.dart';
import 'package:quizzard/model/questions.dart';
import 'package:quizzard/model/quiz.dart';

class StartQuiz extends StatefulWidget {
  Quiz quiz;
  StartQuiz({super.key, required this.quiz});

  @override
  State<StartQuiz> createState() => _StartQuizState();
}

class _StartQuizState extends State<StartQuiz> {
  Timer? _timer;
  String selectedValue = "";
  int counter = 0;
  int score = 0;
  bool done = false;

  List<bool> isPressed = [false, false, false, false];
  void selectedValueBlanks(String value) {
    setState(() {
      selectedValue = value;
    });
  }

  void add() {
    setState(() {
      if (widget.quiz.type == "4" &&
          counter == widget.quiz.getQuestionTable.length - 2) {
        done = true;
      }
      if (counter == widget.quiz.getQuestionTable.length - 1) {
        done = true;
      }
      if (counter <= widget.quiz.getQuestionTable.length - 2) {
        counter++;
        isPressed = [false, false, false, false];
      }
    });
  }

  void checker(String answer, bool dFlip) {
    bool isCorrect;
    if (selectedValue.toLowerCase() == answer.toLowerCase()) {
      isCorrect = true;
      score++;
    } else {
      isCorrect = false;
    }

    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          _timer = Timer(const Duration(seconds: 1), () {
            Navigator.pop(context);
            add();
          });
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 230, 244, 253),
            content: Container(
              height: isCorrect ? 50 : 130,
              child: dFlip
                  ? const Center(
                      child: Text(
                        "Next",
                        style: TextStyle(
                            fontWeight: FontWeight.w900, fontSize: 22),
                      ),
                    )
                  : isCorrect
                      ? const Center(
                          child: Text(
                            "Correct answer!",
                            style: TextStyle(
                                fontWeight: FontWeight.w900, fontSize: 22),
                          ),
                        )
                      : Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Wrong!",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 22),
                            ),
                            const Text(
                              "The correct answer is:",
                              style: TextStyle(
                                  fontWeight: FontWeight.w900, fontSize: 18),
                            ),
                            Text(
                              answer,
                              textAlign: TextAlign.justify,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w900,
                                  fontSize: 18,
                                  color: Colors.red),
                            )
                          ],
                        ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();
    List<Question> questionList =
        List<Question>.from(widget.quiz.getQuestionTable.keys);
    int length = questionList.length;
    int num = counter + 1;
    bool doesFlip = false;
    bool isFillIn = false;

    if (widget.quiz.type == "4") {
      doesFlip = true;
    }
    if (widget.quiz.type == "3") {
      isFillIn = true;
    }
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Column(
        children: [
          const SizedBox(height: 20),
          Text(widget.quiz.title,
              style:
                  const TextStyle(fontWeight: FontWeight.w900, fontSize: 25)),
          const SizedBox(height: 20),
          Text("$num/$length",
              style:
                  const TextStyle(fontWeight: FontWeight.w900, fontSize: 22)),
          const SizedBox(height: 20),
          doesFlip
              ? FlipCard(
                  key: cardKey,
                  front: QuestionCard(text: questionList[counter].qText),
                  back: QuestionCard(
                      text: widget.quiz.getQuestionTable[questionList[counter]]
                          .toString()),
                )
              : QuestionCard(
                  text: done
                      ? "You completed the quiz! You got a score of $score out of $length items."
                      : questionList[counter].qText),
          const SizedBox(
            height: 20,
          ),
          done
              ? Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      child: Container(
                        padding: const EdgeInsets.all(10),
                        width: double.infinity,
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
                            "Done",
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.w600,
                                fontSize: 20),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                )
              : isFillIn
                  ? Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        TextField(
                          autofocus: true,
                          onChanged: (value) {
                            selectedValueBlanks(value);
                          },
                          decoration: InputDecoration(
                              contentPadding: const EdgeInsets.only(
                                  left: 15.0,
                                  right: 15.0,
                                  top: 10.0,
                                  bottom: 10.0),
                              filled: true,
                              fillColor: Colors.white,
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(19),
                                borderSide: BorderSide.none,
                              ),
                              hintText: 'Enter answer',
                              hintStyle: const TextStyle(
                                fontWeight: FontWeight.normal,
                                fontStyle: FontStyle.italic,
                                fontSize: 17,
                                color: Color(0xFF727272),
                              )),
                        ),
                        const SizedBox(
                          height: 40,
                        ),
                        GestureDetector(
                          child: Container(
                            padding: const EdgeInsets.all(10),
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
                          onTap: () {
                            checker(
                                widget.quiz
                                    .getQuestionTable[questionList[counter]]
                                    .toString(),
                                doesFlip);
                            if (counter == 4) {
                              length = 0;
                            }
                          },
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                      ],
                    )
                  : Expanded(
                      child: ListView.builder(
                        itemCount: questionList[counter].choices.length + 1,
                        itemBuilder: (context, index) {
                          if (index == questionList[counter].choices.length) {
                            return Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                GestureDetector(
                                  child: Container(
                                    padding: const EdgeInsets.all(10),
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
                                  onTap: () {
                                    checker(
                                        widget
                                            .quiz
                                            .getQuestionTable[
                                                questionList[counter]]
                                            .toString(),
                                        doesFlip);
                                    if (counter == 4) {
                                      length = 0;
                                    }
                                    if (doesFlip) {
                                      if (cardKey.currentState != null) {
                                        //null safety
                                        if (!cardKey.currentState!.isFront) {
                                          cardKey.currentState!.toggleCard();
                                        }
                                      }
                                    }
                                  },
                                ),
                              ],
                            );
                          }
                          return Column(
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    for (int i = 0; i < 4; i++) {
                                      isPressed[i] = false;
                                    }
                                    isPressed[index] = true;
                                    selectedValue =
                                        questionList[counter].choices[index];
                                  });
                                },
                                child: Container(
                                  padding: const EdgeInsets.all(20),
                                  //height: 70,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(12),
                                    color: isPressed[index]
                                        ? Colors.green
                                        : Colors.white,
                                    boxShadow: const [
                                      BoxShadow(
                                        color: Colors.grey,
                                        blurRadius: 2.0,
                                        spreadRadius: 0.0,
                                        offset: Offset(2.0, 2.0),
                                      )
                                    ],
                                  ),
                                  child: Text(
                                    questionList[counter].choices[index],
                                    style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: isPressed[index]
                                            ? Colors.white
                                            : Colors.black),
                                  ),
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
    );
  }
}
