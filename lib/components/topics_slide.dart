import 'package:flutter/material.dart';
import 'package:quizzard/components/topic_tile.dart';
import 'package:quizzard/model/topic.dart';

class TopicSlide extends StatelessWidget {
  final List<Topic> topicList;
  const TopicSlide({super.key, required this.topicList});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: topicList.length,
          itemBuilder: (context, index) {
            int i = index;
            List<Color> colors = [Colors.orange, Colors.purple, Colors.green];
            List<String> images = [
              'lib/assets/home.svg',
              'lib/assets/topic_image2.svg',
              'lib/assets/topic_image1.svg'
            ];

            if (index > 2) {
              i = index % 3;
            }
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TopicTile(
                topic: topicList[index],
                color: colors[i],
                imageUrl: images[i],
              ),
            );
          }),
    );
  }
}
