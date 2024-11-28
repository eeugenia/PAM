class Category {
  final String name;
  final String image;

  Category({required this.name, required this.image});

  // Metodă factory pentru a crea un obiect Category dintr-un map
  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      name: json['name'] as String,
      image: json['image'] as String,
    );
  }
}