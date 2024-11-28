import 'package:laborator4/data/datasources/category_data_source.dart';
import 'package:laborator4/domain/entities/category.dart';

class CategoryRepository {
  final CategoryDataSource categoryDataSource;

  // Constructor care primește data source-ul
  CategoryRepository({required this.categoryDataSource});

  // Metodă pentru a obține categoriile
  Future<List<Category>> getCategories() async {
    return await categoryDataSource.fetchCategories();
  }
}
