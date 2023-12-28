import 'package:flutter/material.dart';
import 'package:quizzard/model/topic.dart';
import 'package:quizzard/pages/search_page.dart';

class SearchButton extends StatelessWidget {
  final String type;
  final Topic topic;
  const SearchButton({super.key, required this.type, required this.topic});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => SearchPage(
                    type: type,
                    topic: topic,
                  ))),
      child: Container(
        //padding: const EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(children: [
          Icon(
            Icons.search,
            color: Colors.grey[800],
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "What do you want to learn?",
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
                fontWeight: FontWeight.w500),
          ),
        ]),
      ),
    );
  }
}
