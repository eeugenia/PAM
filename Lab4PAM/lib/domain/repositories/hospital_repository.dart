import 'package:laborator4/domain/entities/category.dart';
import 'package:laborator4/domain/entities/doctor.dart';
import 'package:laborator4/domain/entities/center.dart';

abstract class HospitalRepository {
  Future<List<Category>> getCategories();
  Future<List<Doctor>> getDoctors();
  Future<List<Center>> getNearbyCenters();
}
