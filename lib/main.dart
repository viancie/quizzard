import 'package:flutter/material.dart';
import 'package:quizzard/pages/intro_page.dart';
import 'package:quizzard/pages/search_page.dart';
import 'package:quizzard/pages/topic_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: const TopicPage(), routes: {
      '/intro_page': (context) => const IntroPage(),
      '/topic_page': (context) => const TopicPage(),
      '/search_page': (context) => const SearchPage(),
    });
  }
}
