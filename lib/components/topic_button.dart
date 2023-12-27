import 'package:flutter/material.dart';

class TopicButton extends StatefulWidget {
  final bool isClicked;
  final void Function()? onTap;
  const TopicButton({super.key, required this.isClicked, required this.onTap});

  @override
  State<TopicButton> createState() => _TopicButtonState();
}

class _TopicButtonState extends State<TopicButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
    );
  }
}
