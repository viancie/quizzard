import 'package:flutter/material.dart';

class NewBlanksQuestion extends StatefulWidget {
  const NewBlanksQuestion({super.key});

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
       ),
    );
  }
}