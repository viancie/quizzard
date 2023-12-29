import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class NewBlanksQuestion extends StatefulWidget {
  final qController;
  final answerController;
  VoidCallback onCreate;
  VoidCallback onCancel;
  VoidCallback onUpdate;

  String action;
  NewBlanksQuestion(
      {super.key,
      required this.qController,
      required this.answerController,
      required this.onCreate,
      required this.onCancel,
      required this.onUpdate,
      required this.action});

  @override
  State<NewBlanksQuestion> createState() => _NewBlanksQuestionState();
}

class _NewBlanksQuestionState extends State<NewBlanksQuestion> {
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
                  SvgPicture.asset("lib/assets/fill_blanks.svg")
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
              // enter answer
              TextField(
                controller: widget.answerController,
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
                    hintText: 'Enter answer',
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
                    onTap: widget.action == "Create"
                        ? widget.onCreate
                        : widget.onUpdate,
                    child: Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Color(0xFF52C3FF),
                        ),
                        child: Center(
                          child: Text(
                            widget.action == "Create" ? "Create" : "Update",
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
          )),
    );
  }
}
