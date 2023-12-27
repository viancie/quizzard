import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

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
            onTabChange: (index) {
              if (index == 0) {
                Navigator.pushNamed(context, '/topic_page');
              }
              if (index == 1) {
                Navigator.pushNamed(context, '/bookmark_page');
              }
            },
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
          "Quizzard! // forr quiz na",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
    );
  }
}
