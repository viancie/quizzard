import 'package:flutter/material.dart';
import 'package:quizzard/pages/bookmark_page.dart';
import 'package:quizzard/pages/quiz_page.dart';
import 'package:quizzard/pages/topic_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [TopicPage(), BookmarkPage(), QuizPage()];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: NavigationBarThemeData(
          indicatorColor: const Color.fromARGB(255, 82, 195, 255),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: NavigationBar(
              height: 60,
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              shadowColor: Colors.black,
              animationDuration: Duration(seconds: 1),
              backgroundColor: Colors.white,
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: const [
                NavigationDestination(
                    icon: Icon(
                      Icons.home,
                    ),
                    label: 'Home'),
                NavigationDestination(
                    icon: Icon(
                      Icons.bookmark,
                    ),
                    label: 'Bookmark'),
                NavigationDestination(
                    icon: Icon(
                      Icons.search,
                    ),
                    label: 'Quiz'),
              ]),
        ),
      ),
    );
  }
}
