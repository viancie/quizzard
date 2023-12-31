import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizzard/model/quiz.dart';
import 'package:quizzard/pages/editQuiz_page.dart';
import 'package:quizzard/pages/playQuiz_page.dart';

class MyQuiz extends StatefulWidget {
  final Quiz quiz;
  final int typeQuiz; // 0 means customize, -1 means built in
  const MyQuiz({super.key, required this.quiz, required this.typeQuiz});

  @override
  State<MyQuiz> createState() => _MyQuiz();
}

class _MyQuiz extends State<MyQuiz> {
  void checker() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            backgroundColor: const Color.fromARGB(255, 230, 244, 253),
            content: Container(
                height: 50,
                child: const Center(
                  child: Text(
                    "Quiz is empty!",
                    style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
                  ),
                )),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(bottom: 15, right: 10),
        width: 171,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(14),
            boxShadow: const [
              BoxShadow(
                color: Colors.grey,
                blurRadius: 2.0,
                spreadRadius: 0.0,
                offset: Offset(2.0, 2.0),
              )
            ]),
        child: Padding(
          padding:
              const EdgeInsets.only(left: 18, right: 18, top: 18, bottom: 18),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: Text(widget.quiz.title,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 16)),
              ),
              SizedBox(
                height: 3,
              ),
              // type
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  widget.quiz.type == "1"
                      ? "Type: Multiple Choice"
                      : widget.quiz.type == "2"
                          ? "Type: True or False"
                          : widget.quiz.type == "3"
                              ? "Type: Fill in the Blanks"
                              : "Type: Flash Cards",
                  style: const TextStyle(
                    fontSize: 12,
                    fontStyle: FontStyle.italic,
                    color: Color(0xFF4B4B4B),
                  ),
                ),
              ),
              SizedBox(
                height: 3,
              ),
              // number of items
              Align(
                alignment: Alignment.topLeft,
                child: Text(
                  "Items: ${widget.quiz.questionTable.length}",
                  style: const TextStyle(
                    fontSize: 12,
                    color: Color(0xFF4B4B4B),
                    fontStyle: FontStyle.italic,
                  ),
                ),
              ),
              SizedBox(
                height: 6,
              ),

              widget.typeQuiz == 0
                  ? Padding(
                      padding: const EdgeInsets.only(left: 53),
                      child: Row(
                        children: [
                          // play icon

                          GestureDetector(
                              onTap: () {
                                if (widget.quiz.questionTable.isEmpty) {
                                  checker();
                                } else {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              PlayQuizPage(quiz: widget.quiz)));
                                }
                              },
                              child:
                                  SvgPicture.asset("lib/assets/play_icon.svg")),

                          SizedBox(
                            width: 7,
                          ),

                          // edit icon
                          Padding(
                            padding: const EdgeInsets.only(left: 2),
                            child: GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            EditQuizPage(quiz: widget.quiz))),
                                child: SvgPicture.asset(
                                    "lib/assets/edit_icon.svg")),
                          )
                        ],
                      ),
                    )
                  : Padding(
                      padding: const EdgeInsets.only(left: 100),
                      child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PlayQuizPage(quiz: widget.quiz)));
                          },
                          child: SvgPicture.asset("lib/assets/play_icon.svg")),
                    ),
            ],
          ),
        ));
  }
}
