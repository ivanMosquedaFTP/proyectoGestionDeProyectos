import 'package:flutter/material.dart';
import '../models/user.dart';

class AuthProvider with ChangeNotifier {
  User? _user;
  bool _isLoggedIn = false;

  User? get user => _user;
  bool get isLoggedIn => _isLoggedIn;

  void login(String email, String password) {
    // Simulación de login sin backend
    if (email.isNotEmpty && password.isNotEmpty) {
      _user = User(name: "Usuario", email: email);
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  void register(String name, String email, String password) {
    // Simulación de registro
    if (name.isNotEmpty && email.isNotEmpty && password.isNotEmpty) {
      _user = User(name: name, email: email);
      _isLoggedIn = true;
      notifyListeners();
    }
  }

  void logout() {
    _user = null;
    _isLoggedIn = false;
    notifyListeners();
  }
}