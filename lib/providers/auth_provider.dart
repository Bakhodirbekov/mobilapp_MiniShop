import 'package:flutter/foundation.dart';

class AuthProvider with ChangeNotifier {
  Map<String, dynamic>? _currentUser;

  Map<String, dynamic>? get currentUser => _currentUser;

  bool get isLoggedIn => _currentUser != null;

  void login(String email, String name) {
    _currentUser = {
      'email': email,
      'name': name,
    };
    notifyListeners();
  }

  void register(String email, String name) {
    _currentUser = {
      'email': email,
      'name': name,
    };
    notifyListeners();
  }

  void logout() {
    _currentUser = null;
    notifyListeners();
  }

  void updateProfile(Map<String, dynamic> data) {
    if (_currentUser != null) {
      _currentUser!.addAll(data);
      notifyListeners();
    }
  }
}