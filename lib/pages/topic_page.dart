import 'package:flutter/material.dart';
import 'package:quizzard/components/search_button.dart';
import 'package:quizzard/components/topic_button.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class TopicPage extends StatelessWidget {
  const TopicPage({super.key});

  void nextPage() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
        child: GNav(
            backgroundColor: Colors.white,
            color: Colors.grey,
            activeColor: Colors.white,
            tabBorderRadius: 10,
            tabBackgroundColor: const Color.fromARGB(255, 82, 195, 255),
            iconSize: 30,
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            tabShadow: [
              BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 8)
            ],
            //mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            tabs: const [
              GButton(icon: Icons.home, text: "Home"),
              GButton(icon: Icons.bookmark, text: "Bookmark"),
              GButton(icon: Icons.search, text: "Quiz")
            ]),
      ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Welcome to Quizzard!",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(25),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 20),
          SearchButton(),
          SizedBox(height: 30),
          Text(
            "Topics",
            style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
          ),
          SizedBox(height: 20),

          //tong mga all topics
          Row(
            children: [
              TopicButton(
                isClicked: true,
                onTap: null,
                icon: Icons.snowing,
                text: "All Topics",
                color: Colors.red,
              ),
              const SizedBox(
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
          SizedBox(height: 20),
          Row(
            children: [
              TopicButton(
                isClicked: false,
                onTap: null,
                icon: Icons.star,
                text: "Newest",
                color: Colors.purple,
              ),
              const SizedBox(
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
        ]),
      ),
    );
  }
}
