import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class CreateQuiz extends StatefulWidget {
  final int type;
  final controller;
  VoidCallback onCreate;
  VoidCallback onCancel;
  CreateQuiz(
      {super.key,
      required this.type,
      required this.controller,
      required this.onCreate,
      required this.onCancel});

  @override
  State<CreateQuiz> createState() => _CreateQuizState();
}

class _CreateQuizState extends State<CreateQuiz> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: const Color(0xFFE6F4FD),
      content: Container(
          width: 335,
          height: 150,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Row(children: [
                  const Text("My Quiz",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.w900)),
                  SizedBox(
                    width: 10,
                  ),
                  widget.type == 1
                      ? SvgPicture.asset("lib/assets/multiple_choice.svg")
                      : widget.type == 2
                          ? SvgPicture.asset("lib/assets/true_false.svg")
                          : widget.type == 3
                              ? SvgPicture.asset("lib/assets/fill_blanks.svg")
                              : SvgPicture.asset("lib/assets/flash_cards.svg")
                ]),
              ),

              // textfield
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: TextField(
                  controller: widget.controller,
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
                      hintText: 'Enter quiz title',
                      hintStyle: const TextStyle(
                        fontWeight: FontWeight.normal,
                        fontStyle: FontStyle.italic,
                        fontSize: 14,
                        color: Color(0xFF727272),
                      )),
                ),
              ),

              // create and cancel button
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // create button
                  GestureDetector(
                    onTap: widget.onCreate,
                    child: Container(
                        height: 40,
                        width: 110,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(19),
                          color: Color(0xFF52C3FF),
                        ),
                        child: const Center(
                          child: Text(
                            "Create",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                        )),
                  ),

                  // cancel button
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
                  )
                ],
              )
            ],
          )),
    );
  }
}
