class Center {
  final String name;
  final String location;
  final String imageUrl;
  final String rating;
  final String reviews;

  Center({
    required this.name,
    required this.location,
    required this.imageUrl,
    required this.rating,
    required this.reviews,
  });

  // Metodă factory pentru a crea un obiect Center dintr-un map
  factory Center.fromJson(Map<String, dynamic> json) {
    return Center(
      name: json['name'] as String,
      location: json['location'] as String,
      imageUrl: json['image'] as String,
      rating: json['rating'] as String,
      reviews: json['reviews'] as String,
    );
  }
}
