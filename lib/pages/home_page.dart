import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:quizzard/controller/datarepo.dart';
import 'package:quizzard/model/topic.dart';
import 'package:quizzard/pages/bookmark_page.dart';
import 'package:quizzard/pages/quiz_page.dart';
import 'package:quizzard/pages/topic_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _myBox = Hive.box('myBox1');

  int index = 0;

  @override
  Widget build(BuildContext context) {
    final screens = [TopicPage(), BookmarkPage(), const QuizPage()];

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      body: screens[index],
      bottomNavigationBar: NavigationBarTheme(
        data: const NavigationBarThemeData(
          indicatorColor: Color.fromARGB(255, 82, 195, 255),
        ),
        child: Padding(
          padding: const EdgeInsets.all(30),
          child: NavigationBar(
              height: 60,
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              shadowColor: Colors.black,
              animationDuration: const Duration(seconds: 1),
              backgroundColor: Colors.white,
              selectedIndex: index,
              onDestinationSelected: (index) =>
                  setState(() => this.index = index),
              destinations: [
                NavigationDestination(
                    icon: SvgPicture.asset('lib/assets/home.svg'),
                    label: 'Home'),
                NavigationDestination(
                    icon: SvgPicture.asset('lib/assets/tabler_book.svg'),
                    label: 'Bookmark'),
                NavigationDestination(
                    icon: SvgPicture.asset('lib/assets/healthicons_q.svg'),
                    label: 'Quiz'),
              ]),
        ),
      ),
    );
  }
}
