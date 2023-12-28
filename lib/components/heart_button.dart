import 'package:flutter/material.dart';

class HeartButton extends StatefulWidget {
  bool isLiked;
  Color colorClicked;
  Color colorNotClicked;
  final void Function()? onTap;
  HeartButton(
      {super.key,
      required this.isLiked,
      required this.onTap,
      required this.colorClicked,
      required this.colorNotClicked});

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
        widget.isLiked ? Icons.favorite : Icons.favorite_outline,
        color: widget.isLiked ? widget.colorClicked : widget.colorNotClicked,
      ),
    );
  }
}
