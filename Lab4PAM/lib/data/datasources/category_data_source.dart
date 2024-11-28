import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:laborator4/domain/entities/category.dart';

class CategoryDataSource {
  // Metodă pentru a citi lista de categorii din fișierul JSON local
  Future<List<Category>> fetchCategories() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response);

    List<Category> categories = [];
    for (var category in data['categories']) {
      categories.add(Category.fromJson(category));
    }
    return categories;
  }
}
