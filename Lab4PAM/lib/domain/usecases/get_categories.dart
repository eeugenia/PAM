import 'package:laborator4/domain/entities/category.dart';
import 'package:laborator4/domain/repositories/hospital_repository.dart';

class GetCategories {
  final HospitalRepository repository;

  GetCategories(this.repository);

  Future<List<Category>> execute() async {
    return await repository.getCategories();
  }
}
