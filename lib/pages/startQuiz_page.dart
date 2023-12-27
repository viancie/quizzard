import 'package:flutter/material.dart';

class StartQuiz extends StatelessWidget {
  const StartQuiz({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Quizzard! // start quiz",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}