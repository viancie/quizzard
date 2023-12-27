import 'package:flutter/material.dart';

class TopicButton extends StatefulWidget {
  final bool isClicked;
  final void Function()? onTap;
  final IconData icon;
  final String text;
  final Color color;
  const TopicButton(
      {super.key,
      required this.isClicked,
      required this.onTap,
      required this.icon,
      required this.text,
      required this.color});

  @override
  State<TopicButton> createState() => _TopicButtonState();
}

class _TopicButtonState extends State<TopicButton> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
          width: 150,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: widget.isClicked
                ? const Color.fromARGB(255, 82, 195, 255)
                : Colors.white,
            borderRadius: BorderRadius.circular(40),
            boxShadow: [
              widget.isClicked
                  ? const BoxShadow()
                  : const BoxShadow(
                      color: Colors.grey,
                      blurRadius: 2.0,
                      spreadRadius: 0.0,
                      offset: Offset(2.0, 2.0),
                    )
            ],
          ),
          child: Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: widget.isClicked ? Colors.white : widget.color,
                ),
                child: Icon(
                  widget.icon,
                  color: widget.isClicked
                      ? const Color.fromARGB(255, 82, 195, 255)
                      : Colors.white,
                ),
              ),
              const SizedBox(
                width: 10,
              ),
              Text(
                widget.text,
                style: TextStyle(
                    color: widget.isClicked ? Colors.white : Colors.black,
                    fontSize: 15),
              ),
              // const SizedBox(
              //   width: 20,
              // ),
            ],
          )),
    );
  }
}
