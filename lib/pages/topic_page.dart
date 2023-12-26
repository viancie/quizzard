import 'package:flutter/material.dart';
import 'package:quizzard/components/search_button.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({super.key});

  void nextPage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Welcome to Quizzard!",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(25),
        child: Column(children: [
          SizedBox(height: 20),
          SearchButton(),
        ]),
      ),
    );
  }
}
