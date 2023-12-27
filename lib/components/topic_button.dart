import 'package:flutter/material.dart';

class TopicButton extends StatefulWidget {
  final bool isClicked;
  final void Function()? onTap;
  final Icon icon;
  const TopicButton(
      {super.key,
      required this.isClicked,
      required this.onTap,
      required this.icon});

  @override
  State<TopicButton> createState() => _TopicButtonState();
}

class _TopicButtonState extends State<TopicButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        decoration: BoxDecoration(
          color: widget.isClicked
              ? const Color.fromARGB(255, 82, 195, 255)
              : Colors.white,
        ),
      ),
    );
  }
}
