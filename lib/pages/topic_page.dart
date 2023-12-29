import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:quizzard/components/search_button.dart';
import 'package:quizzard/components/topic_button.dart';
import 'package:quizzard/components/topic_tile.dart';
import 'package:quizzard/controller/datarepo.dart';
import 'package:quizzard/model/topic.dart';

class TopicPage extends StatefulWidget {
  const TopicPage({super.key});
  @override
  State<TopicPage> createState() => _TopicPageState();
}

class _TopicPageState extends State<TopicPage> {
  final _myBox = Hive.box('myBox');
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  bool isClicked1 = true;
  bool isClicked2 = false;
  bool isClicked3 = false;
  bool isClicked4 = false;
  void toggleClick1() {
    setState(() {
      isClicked1 = !isClicked1;
      isClicked2 = isClicked3 = isClicked4 = false;
      topicList = DataRepository.topicList;
    });
  }

  void toggleClick2() {
    setState(() {
      isClicked2 = !isClicked2;
      isClicked1 = isClicked3 = isClicked4 = false;
      topicList = DataRepository.popularList;
    });
  }

  void toggleClick3() {
    setState(() {
      isClicked3 = !isClicked3;
      isClicked1 = isClicked2 = isClicked4 = false;
      topicList = DataRepository.newestList;
    });
  }

  void toggleClick4() {
    setState(() {
      isClicked4 = !isClicked4;
      isClicked1 = isClicked2 = isClicked3 = false;
      topicList = DataRepository.favoriteList;
    });
  }

  List<Topic> topicList = DataRepository.topicList;

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
          height: 670,
          child: Padding(
            padding: const EdgeInsets.all(25),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const SizedBox(height: 20),
              SearchButton(
                  type: "1",
                  topic: Topic(
                      topicName: "rawr", description: "ngi", isLiked: "wow")),
              const SizedBox(height: 30),
              const Text(
                "Topics",
                style: TextStyle(fontWeight: FontWeight.w900, fontSize: 25),
              ),
              const SizedBox(height: 20),

              //tong mga all topics
              Row(
                children: [
                  TopicButton(
                    isClicked: isClicked1,
                    onTap: toggleClick1,
                    iconDefaultPath: "lib/assets/all_topics_unpressed.svg",
                    iconPressedPath: "lib/assets/all_topics_pressed.svg",
                    text: "All Topics",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TopicButton(
                    isClicked: isClicked2,
                    onTap: toggleClick2,
                    iconDefaultPath: "lib/assets/popular_unpressed.svg",
                    iconPressedPath: "lib/assets/popular_pressed.svg",
                    text: "Popular",
                  )
                ],
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  TopicButton(
                    isClicked: isClicked3,
                    onTap: toggleClick3,
                    iconDefaultPath: "lib/assets/newest_unpressed.svg",
                    iconPressedPath: "lib/assets/newest_pressed.svg",
                    text: "Newest",
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  TopicButton(
                    isClicked: isClicked4,
                    onTap: toggleClick4,
                    iconDefaultPath: "lib/assets/favorite_unpressed.svg",
                    iconPressedPath: "lib/assets/favorite_pressed.svg",
                    text: "Favorite",
                  )
                ],
              ),
              const SizedBox(height: 30),
              //TopicTile(),

              Expanded(
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: topicList.length,
                    itemBuilder: (context, index) {
                      int i = index;
                      List<Color> colors = [
                        Colors.orange,
                        Colors.purple,
                        Colors.green
                      ];
                      List<String> images = [
                        'lib/assets/topic_image.png',
                        'lib/assets/topic_image1.png',
                        'lib/assets/topic_image2.png'
                      ];

                      if (index > 2) {
                        i = index % 3;
                      }
                      return Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: TopicTile(
                          topic: topicList[index],
                          color: colors[i],
                          imageUrl: images[i],
                        ),
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
