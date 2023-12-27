import 'package:flutter/material.dart';
import 'package:quizzard/components/subtopic_tile.dart';

class TopicViewPage extends StatelessWidget {
  const TopicViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 230, 244, 253),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          "Topic View Page",
          style: TextStyle(fontWeight: FontWeight.w900),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(25),
        child: Column(children: [
          const SizedBox(height: 20),
          TextField(
            //onChanged: (value) => //method na pang search
            autofocus: true,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide.none,
              ),
              hintText: "What do you want to learn?",
              prefixIcon: const Icon(Icons.search),
            ),
          ),
          const SizedBox(height: 30),
          Expanded(
            child: ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return const Padding(
                    padding: EdgeInsets.only(bottom: 10, top: 10),
                    child: SubtopicTile(),
                  );
                }),
          )
        ]),
      ),
    );
  }
}
