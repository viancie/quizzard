import 'package:flutter/material.dart';

class TopicViewPage extends StatelessWidget {
  const TopicViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Topic View Page",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
