import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizzard/components/heart_button.dart';
import 'package:quizzard/controller/datarepo.dart';
import 'package:quizzard/model/topic.dart';
import 'package:quizzard/pages/topicView_page.dart';

class TopicTile extends StatefulWidget {
  final Topic topic;
  final Color color;
  final String imageUrl;
  const TopicTile(
      {super.key,
      required this.topic,
      required this.color,
      required this.imageUrl});

  @override
  State<TopicTile> createState() => _TopicTileState();
}

class _TopicTileState extends State<TopicTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => TopicViewPage(topic: widget.topic))),
      child: Container(
        width: 250,
        height: 265,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: widget.color,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SvgPicture.asset(
                widget.imageUrl,
                height: 120,
              ),
              HeartButton(
                isLiked: widget.topic.liked,
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
                  });
                },
                colorClicked: const Color.fromARGB(255, 112, 31, 40),
                colorNotClicked: Colors.white,
              )
            ],
          ),
          Text(
            widget.topic.topicName,
            style: const TextStyle(
                fontSize: 23, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text(
            widget.topic.description,
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
