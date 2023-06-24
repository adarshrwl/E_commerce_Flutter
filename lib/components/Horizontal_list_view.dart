import 'package:flutter/material.dart';

class Horizontal_list_view extends StatelessWidget {
  const Horizontal_list_view({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80.0,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          Icon(Icons.headphones),
          Icon(Icons.headphones),
          Icon(Icons.headphones),
          Icon(Icons.headphones),
        ],
      ),
    );
  }
}

class Category extends StatelessWidget {
  const Category({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
