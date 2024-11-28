import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class HospitalController extends GetxController {
  var categories = [].obs;
  var doctors = [].obs;
  var nearbyCenters = [].obs;

  // Variabile reactive pentru căutare și afișare completă/restrânsă
  var searchQuery = ''.obs;
  var showAll = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadData();
  }

  Future<void> loadData() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = await json.decode(response);
    categories.value = data['categories'];
    doctors.value = data['doctors'];
    nearbyCenters.value = data['nearbyCenters'];
  }

  // Actualizează interogarea de căutare
  void updateSearchQuery(String query) {
    searchQuery.value = query.toLowerCase();
  }

  // Schimbă între afișarea completă și restrânsă
  void toggleShowAll() {
    showAll.value = !showAll.value;
  }

  // Setează showAll la true pentru a afișa toți doctorii
  void showAllDoctors() {
    showAll.value = true;
  }

  // Setează showAll la false pentru a afișa un număr limitat de doctori
  void showLessDoctors() {
    showAll.value = false;
  }

  // Listă filtrată de doctori în funcție de căutare
  List get filteredDoctors {
    if (searchQuery.isEmpty) return doctors;
    return doctors.where((doctor) {
      final name = doctor['name'].toString().toLowerCase();
      final specialty = doctor['specialty'].toString().toLowerCase();
      return name.contains(searchQuery.value) || specialty.contains(searchQuery.value);
    }).toList();
  }

  // Lista de doctori afișată, limitată dacă `showAll` este false
  List get displayedDoctors {
    return showAll.value ? filteredDoctors : filteredDoctors.take(3).toList();
  }
}
