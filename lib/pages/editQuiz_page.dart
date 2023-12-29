import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizzard/components/dialog_blanks.dart';
import 'package:quizzard/components/dialog_cards.dart';
import 'package:quizzard/components/dialog_multiple_choice.dart';
import 'package:quizzard/components/dialog_true_false.dart';
import 'package:quizzard/components/question_tile.dart';
import 'package:quizzard/controller/datarepo.dart';
import 'package:quizzard/model/questions.dart';
import 'package:quizzard/model/quiz.dart';

class EditQuizPage extends StatefulWidget {
  final Quiz quiz;
  static bool aClicked = false;
  static bool bClicked = false;
  static bool cClicked = false;
  static bool dClicked = false;

  static bool trueClicked = false;
  static bool falseClicked = false;

  const EditQuizPage({super.key, required this.quiz});

  @override
  State<EditQuizPage> createState() => _EditQuizPageState();
}

class _EditQuizPageState extends State<EditQuizPage> {
  final TextEditingController qController = TextEditingController();
  final TextEditingController choiceAController = TextEditingController();
  final TextEditingController choiceBController = TextEditingController();
  final TextEditingController choiceCController = TextEditingController();
  final TextEditingController choiceDController = TextEditingController();

  final TextEditingController answerController = TextEditingController();

  late Iterable<Question> ques;
  int selectedQIndex = 0;

  void saveChanges(int index) {
    // saving edited question
    setState(() {
      Question tempQ = ques.elementAt(index);

      if (widget.quiz.type == "1") {
        // multiple choice
        tempQ.qText = qController.text;

        tempQ.choices[0] = choiceAController.text;
        tempQ.choices[1] = choiceBController.text;
        tempQ.choices[2] = choiceCController.text;
        tempQ.choices[3] = choiceDController.text;

        // answer
        if (EditQuizPage.aClicked) {
          widget.quiz.questionTable[tempQ] = tempQ.choices[0];
        } else if (EditQuizPage.bClicked) {
          widget.quiz.questionTable[tempQ] = tempQ.choices[1];
        } else if (EditQuizPage.cClicked) {
          widget.quiz.questionTable[tempQ] = tempQ.choices[2];
        } else {
          widget.quiz.questionTable[tempQ] = tempQ.choices[3];
        }
      } else if (widget.quiz.type == "2") {
        // true or false
        tempQ.qText = qController.text;

        // udpate answer
        if (EditQuizPage.trueClicked) {
          widget.quiz.questionTable[tempQ] = "TRUE";
        }
        else {
          widget.quiz.questionTable[tempQ] = "FALSE";
        }

      } else if (widget.quiz.type == "3") {
        // fill in the blanks
        tempQ.qText = qController.text;
        widget.quiz.questionTable[tempQ] = answerController.text;
      } else {
        // flash cards
        tempQ.qText = qController.text;
        widget.quiz.questionTable[tempQ] = answerController.text;
      }

      qController.clear();
      choiceAController.clear();
      choiceBController.clear();
      choiceCController.clear();
      choiceDController.clear();
      answerController.clear();
      EditQuizPage.aClicked = false;
      EditQuizPage.bClicked = false;
      EditQuizPage.cClicked = false;
      EditQuizPage.dClicked = false;
      EditQuizPage.falseClicked = false;
      EditQuizPage.trueClicked = false;
      Navigator.pop(context);
    });
  }

  void editQuestion(int index) {
    // attempt to edit

    showDialog(
        context: context,
        builder: (context) {
          EditQuizPage.aClicked = false;
          EditQuizPage.bClicked = false;
          EditQuizPage.cClicked = false;
          EditQuizPage.dClicked = false;
          EditQuizPage.falseClicked = false;
          EditQuizPage.trueClicked = false;
          // for multiple chocie
          Question tempQ = ques.elementAt(index);

          if (widget.quiz.type == "1") {
            qController.text = tempQ.qText;

            choiceAController.text = tempQ.choices[0];
            choiceBController.text = tempQ.choices[1];
            choiceCController.text = tempQ.choices[2];
            choiceDController.text = tempQ.choices[3];

            if (widget.quiz.questionTable[tempQ] == tempQ.choices[0]) {
              EditQuizPage.aClicked = true;
            } else if (widget.quiz.questionTable[tempQ] == tempQ.choices[1]) {
              EditQuizPage.bClicked = true;
            } else if (widget.quiz.questionTable[tempQ] == tempQ.choices[2]) {
              EditQuizPage.cClicked = true;
            } else {
              EditQuizPage.dClicked = true;
            }

            return NewMCQuestion(
                qController: qController,
                choiceAController: choiceAController,
                choiceBController: choiceBController,
                choiceCController: choiceCController,
                choiceDController: choiceDController,
                onSaveQuestion: () {},
                onCancel: () => Navigator.pop(context),
                onUpdate: () => saveChanges(index),
                action: "Update");
          }

          // for true or false
          else if (widget.quiz.type == "2") {
            qController.text = tempQ.qText;

            if (widget.quiz.questionTable[tempQ] == "TRUE") {
              EditQuizPage.trueClicked = true;
            }
            else{
              EditQuizPage.falseClicked = true;
   
            }
          

            return NewTFQuestions(
              qController: qController,
              onCreate: () {},
              onCancel: () => Navigator.pop(context),
              onUpdate: () => saveChanges(index),
              action: "Update",
            );
          }

          // for fill in the blanks
          else if (widget.quiz.type == "3") {
            qController.text = tempQ.qText;
            answerController.text = widget.quiz.questionTable[tempQ]!;

            return NewBlanksQuestion(
              qController: qController,
              answerController: answerController,
              onCreate: () {},
              onCancel: () => Navigator.pop(context),
              onUpdate: () => saveChanges(index),
              action: "Update",
            );
          }

          // for flash cards
          else {
            qController.text = tempQ.qText;
            answerController.text = widget.quiz.questionTable[tempQ]!;

            return NewCardsQuestions(
              qController: qController,
              answerController: answerController,
              onCreate: () {},
              onCancel: () => Navigator.pop(context),
              onUpdate: () => saveChanges(index),
              action: "Update",
            );
          }
        });
  }

  void deleteQuestions(int index) {
    setState(() {
      widget.quiz.questionTable.remove(ques.elementAt(index));
    });
  }

  void saveQuestion() {
    setState(() {
      // create choices
      List<String> choices = [];
      if (widget.quiz.type == "1") {
        choices.add("A) ${choiceAController.text}");
        choices.add("B) ${choiceBController.text}");
        choices.add("C) ${choiceCController.text}");
        choices.add("D) ${choiceDController.text}");
      } else if (widget.quiz.type == "2") {
        choices.add("TRUE");
        choices.add("FALSE");
      }

      // create quesion
      Question q = Question(qController.text, choices);

      // for multiple choice questions
      if (widget.quiz.type == "1") {
        if (EditQuizPage.aClicked) {
          widget.quiz.questionTable[q] = choices[0];
        } else if (EditQuizPage.bClicked) {
          widget.quiz.questionTable[q] = choices[1];
        } else if (EditQuizPage.cClicked) {
          widget.quiz.questionTable[q] = choices[2];
        } else {
          widget.quiz.questionTable[q] = choices[3];
        }

        // for true or false question
      } else if (widget.quiz.type == "2") {
        if (EditQuizPage.trueClicked) {
          widget.quiz.questionTable[q] = "TRUE";
        } else {
          widget.quiz.questionTable[q] = "FALSE";
        }
      }

      // for fill in the blanks question
      else if (widget.quiz.type == "3") {
        widget.quiz.questionTable[q] = answerController.text;
      }

      // for flash cards
      else {
        widget.quiz.questionTable[q] = answerController.text;
      }

      List<dynamic> test = DataRepository.myQuizList;
      qController.clear();
      choiceAController.clear();
      choiceBController.clear();
      choiceCController.clear();
      choiceDController.clear();
      answerController.clear();
      Navigator.pop(context);
    });
  }

  void newQuestion() {
    showDialog(
        context: context,
        builder: (context) {
          qController.clear();
          choiceAController.clear();
          choiceBController.clear();
          choiceCController.clear();
          choiceDController.clear();
          answerController.clear();
          EditQuizPage.aClicked = false;
          EditQuizPage.bClicked = false;
          EditQuizPage.cClicked = false;
          EditQuizPage.dClicked = false;
          EditQuizPage.falseClicked = false;
          EditQuizPage.trueClicked = false;

          if (widget.quiz.type == "1") {
            // multiple choice
            return NewMCQuestion(
              qController: qController,
              choiceAController: choiceAController,
              choiceBController: choiceBController,
              choiceCController: choiceCController,
              choiceDController: choiceDController,
              onSaveQuestion: saveQuestion,
              onCancel: () => Navigator.pop(context),
              action: 'Create',
              onUpdate: () {},
            );
          } else if (widget.quiz.type == "2") {
            // true or false
            return NewTFQuestions(
              qController: qController,
              onCreate: saveQuestion,
              onCancel: () => Navigator.pop(context),
              onUpdate: () {},
              action: "Create",
            );
          } else if (widget.quiz.type == "3") {
            return NewBlanksQuestion(
              qController: qController,
              answerController: answerController,
              onCreate: saveQuestion,
              onCancel: () => Navigator.pop(context),
              onUpdate: () {},
              action: "Create",
            );
          } else {
            return NewCardsQuestions(
              qController: qController,
              answerController: answerController,
              onCreate: saveQuestion,
              onCancel: () => Navigator.pop(context),
              onUpdate: () {},
              action: "Create",
            );
          }
        });
  }

  @override
  Widget build(BuildContext context) {
    ques = widget.quiz.questionTable.keys;
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 230, 244, 253),
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            widget.quiz.title,
            style: const TextStyle(fontWeight: FontWeight.w900),
          ),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
            onPressed: newQuestion,
            backgroundColor: const Color(0xFF52C3FF),
            child: const Icon(
              Icons.add,
              color: Colors.white,
            )),
        body: Padding(
          padding:
              const EdgeInsets.only(left: 24, right: 24, top: 15, bottom: 15),
          child: Column(
            children: [
              Row(
                children: [
                  const Text("Questions List",
                      style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 25,
                      )),

                  SizedBox(
                    width: 10,
                  ),
                  // icons
                  widget.quiz.type == "1"
                      ? SvgPicture.asset("lib/assets/multiple_choice.svg")
                      : widget.quiz.type == "2"
                          ? SvgPicture.asset("lib/assets/true_false.svg")
                          : widget.quiz.type == "3"
                              ? SvgPicture.asset("lib/assets/fill_blanks.svg")
                              : SvgPicture.asset("lib/assets/flash_cards.svg")
                ],
              ),
              SizedBox(
                height: 15,
              ),
              // list of questions
              Expanded(
                child: ListView.builder(
                    itemCount: widget.quiz.questionTable.length,
                    itemBuilder: ((context, index) {
                      selectedQIndex = index;
                      return QuestionTile(
                        q: ques.elementAt(index),
                        qNum: selectedQIndex + 1,
                        onDelete: () => deleteQuestions(index),
                        onEditQuestion: () => editQuestion(index),
                      );
                    })),
              ),
            ],
          ),
        ));
  }
}
