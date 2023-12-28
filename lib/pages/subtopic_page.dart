import 'package:flutter/material.dart';
import 'package:quizzard/model/subtopic.dart';

class SubtopicPage extends StatelessWidget {
  final Subtopic subtopic;
  const SubtopicPage({super.key, required this.subtopic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            subtopic.getTopic.getTopicName,
            style: const TextStyle(fontWeight: FontWeight.w900),
          )),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          const SizedBox(
            height: 20,
          ),
          Container(
            padding: const EdgeInsets.all(20),
            height: 70,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.white,
              boxShadow: const [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 2.0,
                  spreadRadius: 0.0,
                  offset: Offset(2.0, 2.0),
                )
              ],
            ),
            child: Center(
              child: Text(
                subtopic.getSubtopicName,
                style:
                    const TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.white,
                boxShadow: const [
                  BoxShadow(
                    color: Colors.grey,
                    blurRadius: 2.0,
                    spreadRadius: 0.0,
                    offset: Offset(2.0, 2.0),
                  )
                ],
              ),
              child: SingleChildScrollView(
                child: Text(
                  subtopic.getDescription,
                  textAlign: TextAlign.justify,
                  style: const TextStyle(fontSize: 17),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
