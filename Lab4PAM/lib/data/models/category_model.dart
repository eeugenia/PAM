import 'package:laborator4/domain/entities/category.dart';

class CategoryModel extends Category {
  CategoryModel({
    required String name,
    required String image,
  }) : super(name: name, image: image);

  // Convertim un map JSON într-un obiect CategoryModel
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      name: json['name'] ?? '',
      image: json['image'] ?? '',
    );
  }

  // Convertim un obiect CategoryModel într-un map JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'image': image,
    };
  }
}
