import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class QuizPage extends StatelessWidget {
  const QuizPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),

      // bottomNavigationBar: Container(
      //   padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
      //   child: GNav(
      //       backgroundColor: Colors.white,
      //       color: Colors.grey,
      //       activeColor: Colors.white,
      //       tabBorderRadius: 10,
      //       tabBackgroundColor: const Color.fromARGB(255, 82, 195, 255),
      //       iconSize: 30,
      //       padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      //       tabShadow: [
      //         BoxShadow(color: Colors.white.withOpacity(0.5), blurRadius: 8)
      //       ],
      //       onTabChange: (index) {
      //         if (index == 0) {
      //           Navigator.pushNamed(context, '/topic_page');
      //         }
      //         if (index == 1) {
      //           Navigator.pushNamed(context, '/bookmark_page');
      //         }
      //       },
      //       tabs: const [
      //         GButton(icon: Icons.home, text: "Home"),
      //         GButton(icon: Icons.bookmark, text: "Bookmark"),
      //         GButton(icon: Icons.search, text: "Quiz")
      //       ]),
      // ),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Quizzard!",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 24, left: 24),
        child: Column(
          children: [
            // text create quiz
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Create Quiz",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  
                )
              ),
            ),
        
            // buttons for type of quiz
            Row(
              children: [
                // multiple choice button
                Container(
                  height: 51,
                  width: 145,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(143),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SvgPicture.asset("lib/assets/multiple_choice.svg",
                        height: 34,
                        width: 34,),
                      ),
                      Text(
                        "Multiple Choice",
                        style: TextStyle(
                          fontSize: 14
                        )
                      )
                    ],
                  )
                ),

                // true or false button
                Container(
                  height: 51,
                  width: 145,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(143),
                  ),
                  child: Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: SvgPicture.asset("lib/assets/true_false.svg",
                        height: 34,
                        width: 34,),
                      ),
                      Text(
                        "True or False",
                        style: TextStyle(
                          fontSize: 14
                        )
                      )
                    ],
                  )
                )
              ]
            )
        
            // my quizzes text
        
            // list of quizzes
        
            // try these! text
        
            // list of built in quizzes 
          ]
        ),
      )
    );
  }
}
