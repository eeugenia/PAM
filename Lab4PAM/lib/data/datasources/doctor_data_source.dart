import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:laborator4/domain/entities/doctor.dart';

class DoctorDataSource {
  // Metodă pentru a citi lista de doctori din fișierul JSON local
  Future<List<Doctor>> fetchDoctors() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response);

    List<Doctor> doctors = [];
    for (var doctor in data['doctors']) {
      doctors.add(Doctor.fromJson(doctor));
    }
    return doctors;
  }
}
