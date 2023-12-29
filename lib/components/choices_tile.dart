import 'package:flutter/material.dart';

class ChoicesTile extends StatefulWidget {
  bool isPressed;
  String text;
  Function()? onTap;
  ChoicesTile(
      {super.key,
      required this.isPressed,
      required this.text,
      required this.onTap});

  @override
  State<ChoicesTile> createState() => _ChoicesTileState();
}

class _ChoicesTileState extends State<ChoicesTile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.all(20),
        //height: 70,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          color: widget.isPressed ? Colors.blue : Colors.white,
          boxShadow: const [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 2.0,
              spreadRadius: 0.0,
              offset: Offset(2.0, 2.0),
            )
          ],
        ),
        child: Text(
          widget.text,
          style: const TextStyle(fontWeight: FontWeight.w500),
        ),
      ),
    );
  }
}
