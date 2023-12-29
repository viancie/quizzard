import 'package:flutter/material.dart';
import 'package:quizzard/components/search_button.dart';
import 'package:quizzard/components/subtopic_tile.dart';
import 'package:quizzard/controller/datarepo.dart';
import 'package:quizzard/model/subtopic.dart';
import 'package:quizzard/model/topic.dart';

class BookmarkPage extends StatelessWidget {
  BookmarkPage({super.key});
  final List<Subtopic> subtopicList = DataRepository.bookmarkList;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Quizzard!",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const SizedBox(height: 20),
          SearchButton(
              type: "3",
              topic:
                  Topic(topicName: "rawr", description: "ngi", isLiked: "wow")),
          const SizedBox(height: 30),
          const Text(
            "Bookmarks",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
          ),
          const SizedBox(height: 20),
          Expanded(
            child: ListView.builder(
                itemCount: subtopicList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: SubtopicTile(
                      subtopic: subtopicList[index],
                    ),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
