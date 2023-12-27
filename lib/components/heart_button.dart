import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {
  bool isLiked;
  final void Function()? onTap;
  HeartButton({super.key, required this.isLiked, required this.onTap});

  @override
  State<HeartButton> createState() => _HeartButtonState();
}

class _HeartButtonState extends State<HeartButton> {
  void toggleLike() {
    setState(() {
      widget.isLiked = !widget.isLiked;
    });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: toggleLike,
      child: Icon(
        Icons.favorite,
        color: widget.isLiked
            ? const Color.fromARGB(255, 112, 31, 40)
            : Colors.white,
      ),
    );
  }
}
