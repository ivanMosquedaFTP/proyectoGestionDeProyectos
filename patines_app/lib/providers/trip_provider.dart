import 'package:flutter/material.dart';
import '../models/trip.dart';

class TripProvider with ChangeNotifier {
  Trip? _currentTrip;

  Trip? get currentTrip => _currentTrip;

  void startTrip(String origin, String destination) {
    _currentTrip = Trip(origin: origin, destination: destination, cost: 5.0);
    notifyListeners();
  }

  void payTrip(String cardNumber, String expiry, String cvv) {
    // Simulación de pago
    if (cardNumber.isNotEmpty && expiry.isNotEmpty && cvv.isNotEmpty) {
      print("Pago exitoso: ${_currentTrip!.cost} con tarjeta $cardNumber");
      _currentTrip = null;
      notifyListeners();
    }
  }
}