import 'package:laborator4/data/datasources/center_data_source.dart';
import 'package:laborator4/domain/entities/center.dart';

class CenterRepository {
  final CenterDataSource centerDataSource;

  // Constructor care primește data source-ul
  CenterRepository({required this.centerDataSource});

  // Metodă pentru a obține centrele
  Future<List<Center>> getCenters() async {
    return await centerDataSource.fetchCenters();
  }
}
