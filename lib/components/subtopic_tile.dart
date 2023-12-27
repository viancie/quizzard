import 'package:flutter/material.dart';
import 'package:quizzard/components/bookmark_button.dart';

class SubtopicTile extends StatelessWidget {
  const SubtopicTile({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, 'subtopic_page'),
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
          const Text(
            "World War 2",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20),
          ),
          BookmarkButton(isLiked: true, onTap: () {}),
        ]),
      ),
    );
  }
}
