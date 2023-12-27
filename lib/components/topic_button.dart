import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class TopicButton extends StatefulWidget {
  final bool isClicked;
  final void Function()? onTap;
  final String iconPressedPath;
  final String iconDefaultPath;
  final String text;
  const TopicButton(
      {super.key,
      required this.isClicked,
      required this.onTap,
      required this.iconPressedPath,
      required this.iconDefaultPath,
      required this.text,
    });

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
                ? const Color(0xFF52C3FF)
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
              
              SvgPicture.asset(widget.isClicked ? widget.iconPressedPath : widget.iconDefaultPath),
              
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
