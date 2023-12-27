import 'package:flutter/material.dart';
import 'package:quizzard/components/heart_button.dart';

class TopicTile extends StatelessWidget {
  const TopicTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'topicView_page'),
      child: Container(
        width: 250,
        height: 265,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: Colors.orange,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'lib/assets/topic_image.png',
                height: 120,
              ),
              HeartButton(
                isLiked: false,
                onTap: () {},
              )
            ],
          ),
          const Text(
            "General History",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          const Text(
            "Dive into history! We will embark on a captivating exploration of the past, unraveling the rich tapestry of human history.",
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontSize: 11,
              color: Colors.white,
            ),
          ),
        ]),
      ),
    );
  }
}
