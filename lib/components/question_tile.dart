import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:quizzard/model/questions.dart';

class QuestionTile extends StatefulWidget {
  final Question q;
  final int qNum;
  VoidCallback onDelete;
  VoidCallback onEditQuestion;
  QuestionTile(
      {super.key,
      required this.q,
      required this.qNum,
      required this.onDelete,
      required this.onEditQuestion});

  @override
  State<QuestionTile> createState() => _QuestionTileState();
}

class _QuestionTileState extends State<QuestionTile> {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 64,
        margin: EdgeInsets.only(bottom: 15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(14),
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            )
          ],
        ),
        child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 20, right: 105),
              child: Text(
                "Question ${widget.qNum}",
                style:
                    const TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
              ),
            ),
            GestureDetector(
                onTap: widget.onEditQuestion,
                child: SvgPicture.asset("lib/assets/edit_icon.svg")),
            SizedBox(
              width: 12,
            ),
            GestureDetector(
                onTap: widget.onDelete,
                child: SvgPicture.asset("lib/assets/delete_icon.svg")),
          ],
        ));
  }
}
