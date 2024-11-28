import 'package:laborator4/domain/entities/center.dart';

class CenterModel extends Center {
  CenterModel({
    required String name,
    required String location,
    required String imageUrl,
    required String rating,
    required String reviews,
  }) : super(
    name: name,
    location: location,
    imageUrl: imageUrl,
    rating: rating,
    reviews: reviews,
  );

  // Convertim un map JSON într-un obiect CenterModel
  factory CenterModel.fromJson(Map<String, dynamic> json) {
    return CenterModel(
      name: json['name'] ?? '',
      location: json['location'] ?? '',
      imageUrl: json['image'] ?? '',
      rating: json['rating'] ?? '',
      reviews: json['reviews'] ?? '',
    );
  }

  // Convertim un obiect CenterModel într-un map JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'location': location,
      'image': imageUrl,
      'rating': rating,
      'reviews': reviews,
    };
  }
}
