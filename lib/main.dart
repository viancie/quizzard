import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:quizzard/controller/datarepo.dart';
import 'package:quizzard/model/topic.dart';
import 'package:quizzard/pages/bookmark_page.dart';
import 'package:quizzard/pages/editQuiz_page.dart';
import 'package:quizzard/pages/home_page.dart';
import 'package:quizzard/pages/intro_page.dart';
import 'package:quizzard/pages/quiz_page.dart';
import 'package:quizzard/pages/search_page.dart';
import 'package:quizzard/pages/startQuiz_page.dart';
import 'package:quizzard/pages/subtopic_page.dart';
import 'package:quizzard/pages/topicView_page.dart';
import 'package:quizzard/pages/topic_page.dart';

late Box box;
Future<void> main() async {
  await Hive.initFlutter();

  final box = await Hive.openBox('myBox1');

  // DataRepository.loadData();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const IntroPage(), routes: {
      '/home_page': (context) => const HomePage(),
      '/intro_page': (context) => const IntroPage(),
      '/topic_page': (context) => const TopicPage(),
      //'/search_page': (context) => SearchPage(),
      //'topicView_page': (context) => const TopicViewPage(),
      //'subtopic_page': (context) => const SubtopicPage(),
      '/bookmark_page': (context) => BookmarkPage(),
      '/quiz_page': (context) => const QuizPage(),
      //'/startQuiz_page': (context) => StartQuiz(),
      // '/editQuiz_page': (context) => const EditQuizPage(),
    });
  }
}
