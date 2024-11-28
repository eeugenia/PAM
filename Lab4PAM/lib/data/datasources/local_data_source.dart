import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:laborator4/data/models/category_model.dart';
import 'package:laborator4/data/models/doctor_model.dart';
import 'package:laborator4/data/models/center_model.dart';
import 'package:laborator4/domain/entities/category.dart';
import 'package:laborator4/domain/entities/doctor.dart';
import 'package:laborator4/domain/entities/center.dart';

class LocalDataSource {
  // Încărcarea categoriilor din fișierul JSON
  Future<List<Category>> getCategories() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final data = json.decode(response);
      List<Category> categories = [];
      for (var category in data['categories']) {
        categories.add(CategoryModel.fromJson(category));
      }
      return categories;
    } catch (e) {
      throw Exception('Failed to load categories from local data source: $e');
    }
  }

  // Încărcarea doctorilor din fișierul JSON
  Future<List<Doctor>> getDoctors() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final data = json.decode(response);
      List<Doctor> doctors = [];
      for (var doctor in data['doctors']) {
        doctors.add(DoctorModel.fromJson(doctor));
      }
      return doctors;
    } catch (e) {
      throw Exception('Failed to load doctors from local data source: $e');
    }
  }

  // Încărcarea centrelor din fișierul JSON
  Future<List<Center>> getNearbyCenters() async {
    try {
      final String response = await rootBundle.loadString('assets/data.json');
      final data = json.decode(response);
      List<Center> centers = [];
      for (var center in data['nearbyCenters']) {
        centers.add(CenterModel.fromJson(center));
      }
      return centers;
    } catch (e) {
      throw Exception('Failed to load nearby centers from local data source: $e');
    }
  }
}
