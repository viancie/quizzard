import 'package:flutter/material.dart';
import 'package:quizzard/components/subtopic_tile.dart';
import 'package:quizzard/components/topicsearch_tile.dart';
import 'package:quizzard/controller/datarepo.dart';
import 'package:quizzard/model/subtopic.dart';
import 'package:quizzard/model/topic.dart';

class SearchPage extends StatefulWidget {
  final String type;
  final Topic topic;
  SearchPage({super.key, required this.type, required this.topic});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  List<Subtopic> subtopics = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    if (widget.type == "2") {
      subtopics = List.from(widget.topic.getSubtopics);
    }
  }

  int length = 0;
  List<Topic> topicList = List.from(DataRepository.topicList);
  List<Subtopic> subtopicList = List.from(DataRepository.bookmarkList);

  void lengthNum() {
    if (widget.type == "1") {
      length = topicList.length;
    } else if (widget.type == "2") {
      length = subtopics.length;
    } else {
      length = subtopicList.length;
    }
  }

  void updateList1(String value) {
    setState(() {
      topicList = DataRepository.topicList
          .where((element) =>
              element.getTopicName!.toLowerCase().contains(value.toLowerCase()))
          .toList();
      lengthNum();
    });
  }

  void updateList2(String value) {
    setState(() {
      subtopics = widget.topic.getSubtopics
          .where((element) => element.getSubtopicName!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
      lengthNum();
    });
  }

  void updateList3(String value) {
    setState(() {
      subtopicList = DataRepository.bookmarkList
          .where((element) => element.getSubtopicName!
              .toLowerCase()
              .contains(value.toLowerCase()))
          .toList();
      lengthNum();
    });
  }

  @override
  Widget build(BuildContext context) {
    lengthNum();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      appBar: AppBar(
        title: const Text(
          "Search",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(children: [
          const SizedBox(height: 20),
          TextField(
            onChanged: (value) {
              if (widget.type == "1") {
                return updateList1(value);
              } else if (widget.type == "2") {
                return updateList2(value);
              } else {
                return updateList3(value);
              }
            }, //method na pang search
            autofocus: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: "What do you want to learn?",
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
                itemCount: length,
                itemBuilder: (context, index) {
                  if (widget.type == "1") {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: TopicSearch(
                        topic: topicList[index],
                      ),
                    );
                  } else if (widget.type == "2") {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: SubtopicTile(
                        subtopic: subtopics[index],
                      ),
                    );
                  } else {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 10, top: 10),
                      child: SubtopicTile(
                        subtopic: subtopicList[index],
                      ),
                    );
                  }
                }),
          )
        ]),
      ),
    );
  }
}
