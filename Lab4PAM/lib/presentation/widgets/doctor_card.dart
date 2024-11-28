import 'package:flutter/material.dart';

class DoctorCard extends StatelessWidget {
  final String name;
  final String specialty;
  final String imageUrl;
  final String center;
  final String rating;
  final String reviews;

  DoctorCard({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.center,
    required this.rating,
    required this.reviews,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        leading: Image.asset(imageUrl, width: 50, height: 50),
        title: Text(name),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(specialty),
            Text(center),
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
