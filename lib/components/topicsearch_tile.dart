import 'package:flutter/material.dart';
import 'package:quizzard/components/heart_button.dart';
import 'package:quizzard/model/topic.dart';
import 'package:quizzard/pages/topicView_page.dart';

class TopicSearch extends StatelessWidget {
  final Topic topic;
  TopicSearch({super.key, required this.topic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => TopicViewPage(topic: topic))),
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
            topic.getTopicName,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          HeartButton(
            isLiked: topic.getIsLiked,
            onTap: () {},
            colorClicked: Colors.black,
            colorNotClicked: Colors.black,
          ),
        ]),
      ),
    );
  }
}
