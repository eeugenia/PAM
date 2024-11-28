import 'package:laborator4/domain/entities/doctor.dart';

class DoctorModel extends Doctor {
  DoctorModel({
    required String name,
    required String specialty,
    required String imageUrl,
    required String center,
    required String rating,
    required String reviews,
  }) : super(
    name: name,
    specialty: specialty,
    imageUrl: imageUrl,
    center: center,
    rating: rating,
    reviews: reviews,
  );

  // Convertim un map JSON într-un obiect DoctorModel
  factory DoctorModel.fromJson(Map<String, dynamic> json) {
    return DoctorModel(
      name: json['name'] ?? '',
      specialty: json['specialty'] ?? '',
      imageUrl: json['imageUrl'] ?? '',
      center: json['center'] ?? '',
      rating: json['rating'] ?? '',
      reviews: json['reviews'] ?? '',
    );
  }

  // Convertim un obiect DoctorModel într-un map JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'imageUrl': imageUrl,
      'center': center,
      'rating': rating,
      'reviews': reviews,
    };
  }
}
