import 'package:flutter/material.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Navigator.pushNamed(context, '/search_page'),
      child: Container(
        //padding: const EdgeInsets.all(15),
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Row(children: [
          Icon(
            Icons.search,
            color: Colors.grey[800],
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "What do you want to learn? Last test",
            style: TextStyle(
                color: Colors.grey[600],
                fontSize: 16,
                fontWeight: FontWeight.w500),
          )
        ]),
      ),
    );
  }
}
