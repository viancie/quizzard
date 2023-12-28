import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizzard/components/heart_button.dart';
import 'package:quizzard/model/topic.dart';
import 'package:quizzard/pages/topicView_page.dart';

class TopicTile extends StatelessWidget {
  final Topic topic;
  final Color color;
  final String imageUrl;
  const TopicTile(
      {super.key,
      required this.topic,
      required this.color,
      required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(context,
          MaterialPageRoute(builder: (context) => TopicViewPage(topic: topic))),
      child: Container(
        width: 250,
        height: 265,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                imageUrl,
                height: 120,
              ),
              HeartButton(
                isLiked: topic.getIsLiked,
                onTap: () {},
              )
            ],
          ),
          Text(
            topic.topicName,
            style: const TextStyle(
                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            topic.description,
            textAlign: TextAlign.justify,
            style: const TextStyle(
              fontSize: 11,
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}
