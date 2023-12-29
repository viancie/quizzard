import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizzard/pages/editQuiz_page.dart';

class NewTFQuestions extends StatefulWidget {
  final qController;

  VoidCallback onCreate;
  VoidCallback onCancel;
  VoidCallback onUpdate;

  String action;

  NewTFQuestions(
      {super.key,
      required this.qController,
     
      required this.onCreate,
      required this.onCancel,
      required this.onUpdate,
      required this.action});

  @override
  State<NewTFQuestions> createState() => _NewTFQuestionsState();
}

class _NewTFQuestionsState extends State<NewTFQuestions> {

  void clickedTrue() {
    setState(() {
      EditQuizPage.trueClicked = true;
      EditQuizPage.falseClicked = false;
    });
  }

  void clickedFalse() {
    setState(() {
      EditQuizPage.trueClicked = false;
      EditQuizPage.falseClicked = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
        backgroundColor: const Color(0xFFE6F4FD),
        content: Container(
          height: 240,
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
                  SvgPicture.asset("lib/assets/true_false.svg")
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: clickedTrue,
                    child: Container(
                      height: 51,
                      width: 110,
                      decoration: BoxDecoration(
                          color: EditQuizPage.trueClicked ? Color(0xFF54AD67) : Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: Center(
                          child: Text("TRUE",
                              style: TextStyle(
                                color: EditQuizPage.trueClicked ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic))),
                    ),
                  ),
                  GestureDetector(
                    onTap: clickedFalse,
                    child: Container(
                      height: 51,
                      width: 110,
                      decoration: BoxDecoration(
                          color: EditQuizPage.falseClicked ? Color(0xFF54AD67) : Colors.white,
                          borderRadius: BorderRadius.circular(13)),
                      child: Center(
                          child: Text("FALSE",
                              style: TextStyle(
                                color: EditQuizPage.falseClicked ? Colors.white : Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                  fontStyle: FontStyle.italic))),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: 
                   widget.action == "Create" ? widget.onCreate : widget.onUpdate,
                    child: Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Color(0xFF52C3FF),
                        ),
                        child: Center(
                          child: Text(
                            widget.action == "Create"?
                            "Create" : "Update",
                            textAlign: TextAlign.center,
                            style: const TextStyle(
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
            ],
          ),
        ));
  }
}
