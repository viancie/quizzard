import 'package:flutter/material.dart';
import 'package:quizzard/components/topic_button.dart';
import 'package:quizzard/model/quiz.dart';

class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  
  List<Quiz> myQuizzes = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),

      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Quizzard!",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(right: 24, left: 24),
        child: Column(
          children: [
            SizedBox(height: 20),
            // text create quiz
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Create Quiz",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  
                )
              ),
            ),
            SizedBox(height: 20),
            // buttons for type of quiz
            const Row(
                children: [
                  TopicButton(
                    isClicked: false,
                    onTap: null,
                    iconDefaultPath: "lib/assets/multiple_choice.svg",
                    iconPressedPath: "lib/assets/multiple_choice.svg",
                    text: "Choices",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TopicButton(
                      isClicked: false,
                      onTap: null,
                      iconDefaultPath: "lib/assets/true_false.svg",
                      iconPressedPath: "lib/assets/true_false.svg",
                      text: "True or False",
                  )  
                ],
              ),
              SizedBox(height: 20),
              const Row(
                children: [
                  TopicButton(
                    isClicked: false,
                    onTap: null,
                    iconDefaultPath: "lib/assets/fill_blanks.svg",
                    iconPressedPath: "lib/assets/fill_blanks.svg",
                    text: "Fill in Blanks",
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  TopicButton(
                      isClicked: false,
                      onTap: null,
                      iconDefaultPath: "lib/assets/flash_cards.svg",
                      iconPressedPath: "lib/assets/flash_cards.svg",
                      text: "Flashcards",
                  ) 
                ],
              ),

            SizedBox(height: 30),
            // my quizzes text
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "My Quizzes",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  
                )
              ),
            ),

            SizedBox(height: 10,),
            // list of quizzes
            myQuizzes.isEmpty ? 
            const Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "You haven't created any quizzes.", 
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontSize: 18,
                  fontWeight: FontWeight.normal
                )),
            ) :
            ListView.builder(
              itemBuilder: (context, index) {
                return Container();
            }),

            // try these! text
            const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Try These!",
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 25,
                  
                )
              ),
            ),
            // list of built in quizzes 
          ]
        ),
      )
    );
  }
}
