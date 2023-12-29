import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quizzard/pages/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final _myBox = Hive.openBox('myBox');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 244, 253),
      body: IconButton(
        icon: Icon(Icons.favorite),
        onPressed: () {
          Navigator.pushNamed(context, '/home_page');
        },
      ),
    );
  }
}
