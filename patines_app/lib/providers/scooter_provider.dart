import 'package:flutter/material.dart';
import '../models/scooter.dart';

class ScooterProvider with ChangeNotifier {
  List<Scooter> _scooters = [
    Scooter(id: "S001", status: "Disponible"),
    Scooter(id: "S002", status: "Disponible"),
    Scooter(id: "S003", status: "En uso"),
  ];

  List<Scooter> get scooters => _scooters;

  int get availableScooters => _scooters.where((s) => s.status == "Disponible").length;

  void reportScooter(String id, String observations) {
    // Simulación de reporte
    print("Reporte: Patín $id - Observaciones: $observations");
    notifyListeners();
  }
}