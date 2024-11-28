import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:laborator4/domain/entities/center.dart';

class CenterDataSource {
  // Metodă pentru a citi lista de centre din fișierul JSON local
  Future<List<Center>> fetchCenters() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data = json.decode(response);

    List<Center> centers = [];
    for (var center in data['nearbyCenters']) {
      centers.add(Center.fromJson(center));
    }
    return centers;
  }
}
