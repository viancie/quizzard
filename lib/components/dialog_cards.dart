import 'package:flutter/material.dart';

class NewCardsQuestions extends StatefulWidget {
  const NewCardsQuestions({super.key});

  @override
  State<NewCardsQuestions> createState() => _NewCardsQuestionsState();
}

class _NewCardsQuestionsState extends State<NewCardsQuestions> {
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