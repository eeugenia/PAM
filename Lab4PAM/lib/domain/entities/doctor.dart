class Doctor {
  final String name;
  final String specialty;
  final String imageUrl;
  final String center;
  final String rating;
  final String reviews;

  Doctor({
    required this.name,
    required this.specialty,
    required this.imageUrl,
    required this.center,
    required this.rating,
    required this.reviews,
  });

  // Metodă factory pentru a crea un obiect Doctor dintr-un map
  factory Doctor.fromJson(Map<String, dynamic> json) {
    return Doctor(
      name: json['name'] as String,
      specialty: json['specialty'] as String,
      imageUrl: json['imageUrl'] as String,
      center: json['center'] as String,
      rating: json['rating'] as String,
      reviews: json['reviews'] as String,
    );
  }
}
