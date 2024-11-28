import 'package:flutter/material.dart';

class CenterCard extends StatelessWidget {
  final String name;
  final String location;
  final String imageUrl;
  final String rating;
  final String reviews;
  final bool largeImage;

  CenterCard({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
    this.largeImage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(imageUrl, width: largeImage ? 80 : 50, height: largeImage ? 80 : 50),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(location),
            Row(
              children: [
                Icon(Icons.star, color: Colors.amber, size: 16),
                SizedBox(width: 4),
                Text('$rating ($reviews)'),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
