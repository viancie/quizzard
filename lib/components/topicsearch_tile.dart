import 'package:flutter/material.dart';
import 'package:quizzard/components/heart_button.dart';
import 'package:quizzard/controller/datarepo.dart';
import 'package:quizzard/model/topic.dart';
import 'package:quizzard/pages/topicView_page.dart';

class TopicSearch extends StatefulWidget {
  final Topic topic;
  TopicSearch({super.key, required this.topic});

  @override
  State<TopicSearch> createState() => _TopicSearchState();
}

class _TopicSearchState extends State<TopicSearch> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TopicViewPage(topic: widget.topic))),
      child: Container(
        padding: const EdgeInsets.all(20),
        height: 70,
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
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Text(
            widget.topic.getTopicName,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          HeartButton(
            isLiked: widget.topic.getIsLiked,
            onTap: () {
              setState(() {
                if (widget.topic.liked) {
                  widget.topic.setIsLiked("FALSE");
                  DataRepository.favoriteList.remove(widget.topic);
                } else {
                  widget.topic.setIsLiked("TRUE");
                  DataRepository.favoriteList.add(widget.topic);
                }
                widget.topic.liked = !widget.topic.liked;
                DataRepository.updateTopicList();
              });
            },
            colorClicked: Colors.black,
            colorNotClicked: Colors.black,
          ),
        ]),
      ),
    );
  }
}
