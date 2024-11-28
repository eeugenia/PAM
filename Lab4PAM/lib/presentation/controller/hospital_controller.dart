import 'package:get/get.dart';
import 'package:laborator4/domain/entities/category.dart';
import 'package:laborator4/domain/entities/doctor.dart';
import 'package:laborator4/domain/entities/center.dart';
import 'package:laborator4/domain/usecases/get_categories.dart';
import 'package:laborator4/domain/usecases/get_doctors.dart';
import 'package:laborator4/domain/usecases/get_nearby_centers.dart';

class HospitalController extends GetxController {
  final GetCategories getCategoriesUseCase;
  final GetDoctors getDoctorsUseCase;
  final GetNearbyCenters getNearbyCentersUseCase;

  var categories = <Category>[].obs;
  var doctors = <Doctor>[].obs;
  var nearbyCenters = <Center>[].obs;

  var searchQuery = ''.obs;
  var showAll = false.obs;

  HospitalController({
    required this.getCategoriesUseCase,
    required this.getDoctorsUseCase,
    required this.getNearbyCentersUseCase,
  });

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    categories.value = await getCategoriesUseCase.execute();
    doctors.value = await getDoctorsUseCase.execute();
    nearbyCenters.value = await getNearbyCentersUseCase.execute();
  }

  void updateSearchQuery(String query) {
    searchQuery.value = query.toLowerCase();
  }

  void showAllDoctors() {
    showAll.value = true;
  }

  void showLessDoctors() {
    showAll.value = false;
  }

  List<Doctor> get filteredDoctors {
    if (searchQuery.isEmpty) return doctors;
    return doctors.where((doctor) {
      final name = doctor.name.toLowerCase();
      final specialty = doctor.specialty.toLowerCase();
      return name.contains(searchQuery.value) || specialty.contains(searchQuery.value);
    }).toList();
  }

  List<Doctor> get displayedDoctors {
    return showAll.value ? filteredDoctors : filteredDoctors.take(3).toList();
  }
}
