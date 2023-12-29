import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizzard/components/dialog_blanks.dart';
import 'package:quizzard/components/dialog_cards.dart';
import 'package:quizzard/components/dialog_multiple_choice.dart';
import 'package:quizzard/components/dialog_true_false.dart';
import 'package:quizzard/components/question_tile.dart';
import 'package:quizzard/model/questions.dart';
import 'package:quizzard/model/quiz.dart';

class EditQuizPage extends StatefulWidget {
  final Quiz quiz;
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

  late bool aClicked = false;
  late bool bClicked = false;
  late bool cClicked = false;
  late bool dClicked = false;

  late Iterable<Question> ques;
  int selectedQIndex = 0;

  void deleteQuestions() {
    setState(() {
      widget.quiz.questionTable.remove(ques.elementAt(selectedQIndex));
    });
  }

  void saveQuestion() {
    setState(() {
      // create choices
      List<String> choices = [];
      if (widget.quiz.type == "1") {
        choices.add(choiceAController.text);
        choices.add(choiceBController.text);
        choices.add(choiceCController.text);
        choices.add(choiceDController.text);
      }

      // create quesion
      Question q = Question(qController.text, choices);

      if (aClicked) {
        widget.quiz.questionTable[q] = choiceAController.text;
      }
      else if (bClicked) {
        widget.quiz.questionTable[q] = choiceBController.text;
      }
      else if (cClicked) {
        widget.quiz.questionTable[q] = choiceCController.text;
      }
      else {
        widget.quiz.questionTable[q] = choiceDController.text;
      }
    
      qController.clear();
      choiceAController.clear();
      choiceBController.clear();
      choiceCController.clear();
      choiceDController.clear();
      Navigator.pop(context);
    });
  }

  void newQuestion() {
    showDialog(
        context: context,
        builder: (context) {
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
              aIsClicked: aClicked,
              bIsClicked: bClicked,
              cIsClicked: cClicked,
              dIsClicked: dClicked,
            );
          } else if (widget.quiz.type == "2") {
            // true or false
            return NewTFQuestions();
          } else if (widget.quiz.type == "3") {
            return NewBlanksQuestion();
          }
          else {
            return NewCardsQuestions();
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
                      selectedQIndex = index + 1;
                      return QuestionTile(
                          q: ques.elementAt(index), qNum: selectedQIndex, onDelete: deleteQuestions,);
                    })),
              ),
            ],
          ),
        ));
  }
}
