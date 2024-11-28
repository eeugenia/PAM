import 'package:laborator4/domain/entities/doctor.dart';
import 'package:laborator4/domain/repositories/hospital_repository.dart';

class GetDoctors {
  final HospitalRepository repository;

  GetDoctors(this.repository);

  Future<List<Doctor>> execute() async {
    return await repository.getDoctors();
  }
}
