import 'package:laborator4/domain/entities/center.dart';
import 'package:laborator4/domain/repositories/hospital_repository.dart';

class GetNearbyCenters {
  final HospitalRepository repository;

  GetNearbyCenters(this.repository);

  Future<List<Center>> execute() async {
    return await repository.getNearbyCenters();
  }
}
