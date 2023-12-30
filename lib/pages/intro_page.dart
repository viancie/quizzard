import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hive/hive.dart';
import 'package:quizzard/controller/datarepo.dart';
import 'package:quizzard/model/topic.dart';
import 'package:quizzard/pages/home_page.dart';

class IntroPage extends StatefulWidget {
  const IntroPage({super.key});

  @override
  State<IntroPage> createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  final _myBox = Hive.box('myBox1');

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    DataRepository.loadData();
    // if (_myBox.isEmpty) {
    //   DataRepository.loadData();
    // } else {
    //   //DataRepository.load();
    // }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromARGB(255, 230, 244, 253),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 70,
                ),
                Image.asset('lib/assets/quizzard_logo.png'),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'Quizzard',
                  style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 30,
                      color: Color(0xFF36A2DB)),
                ),
                const SizedBox(
                  height: 40,
                ),
                Image.asset('lib/assets/quizzard_intro.png'),
                const SizedBox(
                  height: 70,
                ),
                const SizedBox(
                  width: 250,
                  child: Text(
                    'Ignite your Mind, Master your Knowledge!',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontWeight: FontWeight.w900,
                        fontSize: 15,
                        color: Color(0xFF36A2DB)),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => Navigator.pushNamed(context, '/home_page'),
                  child: Container(
                    width: 250,
                    decoration: BoxDecoration(
                        color: Color(0xFF52C3FF),
                        borderRadius: BorderRadius.circular(20)),
                    padding: const EdgeInsets.all(20),
                    child: const Center(
                      child: Text(
                        "Explore",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
