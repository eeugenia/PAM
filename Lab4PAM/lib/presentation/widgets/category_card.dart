import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String category;
  final String imageUrl;

  CategoryCard({required this.category, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(imageUrl, width: 60, height: 60),
        SizedBox(height: 5),
        Text(category, style: TextStyle(fontSize: 14)),
      ],
    );
  }
}
