import 'package:flutter/material.dart';
import 'package:quizzard/components/bookmark_button.dart';
import 'package:quizzard/model/subtopic.dart';
import 'package:quizzard/pages/subtopic_page.dart';

class SubtopicTile extends StatelessWidget {
  final Subtopic subtopic;
  const SubtopicTile({super.key, required this.subtopic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SubtopicPage(subtopic: subtopic))),
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
            subtopic.getSubtopicName,
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          BookmarkButton(isLiked: true, onTap: () {}),
        ]),
      ),
    );
  }
}
