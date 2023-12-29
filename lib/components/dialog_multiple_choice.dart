import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizzard/pages/editQuiz_page.dart';

class NewMCQuestion extends StatefulWidget {
  final qController;
  final choiceAController;
  final choiceBController;
  final choiceCController;
  final choiceDController;
  VoidCallback onSaveQuestion;
  VoidCallback onCancel;
  VoidCallback onUpdate;
  String action; // either create or update
  
  NewMCQuestion(
      {super.key,
      required this.qController,
      required this.choiceAController,
      required this.choiceBController,
      required this.choiceCController,
      required this.choiceDController,
      required this.onSaveQuestion,
      required this.onCancel,
      required this.onUpdate,
      required this.action,
      });

  @override
  State<NewMCQuestion> createState() => _NewMCQuestionState();
}

class _NewMCQuestionState extends State<NewMCQuestion> {
  void clickedA() {
    setState(() {
      EditQuizPage.aClicked = true;
      EditQuizPage.bClicked = EditQuizPage.cClicked = EditQuizPage.dClicked = false;
    });
  }

  void clickedB() {
    setState(() {
      EditQuizPage.bClicked = true;
      EditQuizPage.aClicked = EditQuizPage.cClicked = EditQuizPage.dClicked = false;
    });
  }

  void clickedC() {
    setState(() {
      EditQuizPage.cClicked = true;
      EditQuizPage.aClicked = EditQuizPage.bClicked = EditQuizPage.dClicked = false;
    });
  }

  void clickedD() {
    setState(() {
      EditQuizPage.dClicked = true;
      EditQuizPage.aClicked = EditQuizPage.bClicked = EditQuizPage.cClicked = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFE6F4FD),
      content: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // question details
              Row(
                children: [
                  const Text("Question Details",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                  SizedBox(
                    width: 12,
                  ),
                  SvgPicture.asset("lib/assets/multiple_choice.svg")
                ],
              ),
              SizedBox(
                height: 10,
              ),
              // enter quesion
              TextField(
                controller: widget.qController,
                minLines: 3,
                maxLines: 5,
                keyboardType: TextInputType.multiline,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter question . . .',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      color: Color(0xFF727272),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              // choice A
              TextField(
                controller: widget.choiceAController,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter choice A',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      color: Color(0xFF727272),
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              // choice B
              TextField(
                controller: widget.choiceBController,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter choice B',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      color: Color(0xFF727272),
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              // choice C
              TextField(
                controller: widget.choiceCController,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter choice C',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      color: Color(0xFF727272),
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              // choice D
              TextField(
                controller: widget.choiceDController,
                onTapOutside: (event) {
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                style: const TextStyle(
                  fontWeight: FontWeight.w400,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                    contentPadding: const EdgeInsets.only(
                        left: 15.0, right: 15.0, top: 10.0, bottom: 10.0),
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(19),
                      borderSide: BorderSide.none,
                    ),
                    hintText: 'Enter choice D',
                    hintStyle: const TextStyle(
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.italic,
                      fontSize: 14,
                      color: Color(0xFF727272),
                    )),
              ),
              SizedBox(
                height: 8,
              ),
              // correct answer
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  const Text(
                    "Answer: ",
                    style: TextStyle(
                      fontSize: 12,
                      fontStyle: FontStyle.italic,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: clickedA,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: EditQuizPage.aClicked ? Color(0xFF52C3FF) : Colors.white,
                          borderRadius: BorderRadius.circular(9)),
                      child: Center(
                        child: Text("A",
                            style: TextStyle(
                                color: EditQuizPage.aClicked ? Colors.white : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: clickedB,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: EditQuizPage.bClicked ? Color(0xFF52C3FF) : Colors.white,
                          borderRadius: BorderRadius.circular(9)),
                      child: Center(
                        child: Text("B",
                            style: TextStyle(
                                color: EditQuizPage.bClicked ? Colors.white : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: clickedC,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: EditQuizPage.cClicked ? Color(0xFF52C3FF) : Colors.white,
                          borderRadius: BorderRadius.circular(9)),
                      child: Center(
                        child: Text("C",
                            style: TextStyle(
                                color: EditQuizPage.cClicked  ? Colors.white : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: clickedD,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                          color: EditQuizPage.dClicked  ? Color(0xFF52C3FF) : Colors.white,
                          borderRadius: BorderRadius.circular(9)),
                      child: Center(
                        child: Text("D",
                            style: TextStyle(
                                color: EditQuizPage.dClicked  ? Colors.white : Colors.black,
                                fontSize: 14,
                                fontWeight: FontWeight.w800)),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 8,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: 
                   widget.action == "Create" ? widget.onSaveQuestion : widget.onUpdate,
                    child: Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Color(0xFF52C3FF),
                        ),
                        child: Center(
                          child: Text( widget.action == "Create"?
                            "Create" : "Update",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        )),
                  ),
                  GestureDetector(
                    onTap: widget.onCancel,
                    child: Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Colors.white,
                        ),
                        child: const Center(
                          child: Text(
                            "Cancel",
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
              // buttons
            ],
          ),
        ),
      ),
    );
  }
}
