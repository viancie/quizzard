import 'package:flutter/material.dart';
import 'package:quizzard/components/search_button.dart';
import 'package:quizzard/components/topic_button.dart';
import 'package:quizzard/components/topic_tile.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({super.key});

  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  void nextPage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Welcome to Quizzard!",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: 700,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(height: 20),
              SearchButton(),
              SizedBox(height: 30),
              Text(
                "Topics",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
              ),
              SizedBox(height: 20),

              //tong mga all topics
              const Row(
                children: [
                  TopicButton(
                    isClicked: true,
                    onTap: null,
                    icon: Icons.snowing,
                    text: "All Topics",
                    color: Colors.red,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TopicButton(
                      isClicked: false,
                      onTap: null,
                      icon: Icons.light,
                      text: "Popular",
                      color: Colors.orange),
                ],
              ),
              SizedBox(height: 50),
              const Row(
                children: [
                  TopicButton(
                    isClicked: false,
                    onTap: null,
                    icon: Icons.star,
                    text: "Newest",
                    color: Colors.purple,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TopicButton(
                      isClicked: false,
                      onTap: null,
                      icon: Icons.favorite_border,
                      text: "Favorite",
                      color: Colors.green),
                ],
              ),
              const SizedBox(height: 30),
              //TopicTile(),

              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 4,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TopicTile(),
                      );
                    }),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
