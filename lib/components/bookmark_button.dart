import 'package:flutter/material.dart';

class BookmarkButton extends StatefulWidget {
  bool isLiked;
  final void Function()? onTap;
  BookmarkButton({super.key, required this.isLiked, required this.onTap});

  @override
  State<BookmarkButton> createState() => _BookmarkButtonState();
}

class _BookmarkButtonState extends State<BookmarkButton> {
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
        widget.isLiked ? Icons.bookmark : Icons.bookmark_outline,
        color: Colors.black,
      ),
    );
  }
}
