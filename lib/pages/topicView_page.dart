import 'package:flutter/material.dart';
import 'package:quizzard/components/search_button.dart';
import 'package:quizzard/components/subtopic_tile.dart';
import 'package:quizzard/model/topic.dart';

class TopicViewPage extends StatelessWidget {
  final Topic topic;
  TopicViewPage({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          topic.getTopicName,
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(children: [
          const SizedBox(height: 20),
          const SearchButton(),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
                itemCount: topic.getSubtopics.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(bottom: 10, top: 10),
                    child: SubtopicTile(subtopic: topic.getSubtopics[index]),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
