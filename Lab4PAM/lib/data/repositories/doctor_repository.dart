import 'package:laborator4/data/datasources/doctor_data_source.dart';
import 'package:laborator4/domain/entities/doctor.dart';

class DoctorRepository {
  final DoctorDataSource doctorDataSource;

  // Constructor care primește data source-ul
  DoctorRepository({required this.doctorDataSource});

  // Metodă pentru a obține doctorii
  Future<List<Doctor>> getDoctors() async {
    return await doctorDataSource.fetchDoctors();
  }
}
