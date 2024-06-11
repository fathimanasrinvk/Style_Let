import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class HomeController extends ChangeNotifier {
  String _location = "Kochi, Kerala";
  String get location => _location;

  void setLocation(String newLocation) {
    _location = newLocation;
    notifyListeners();
  }

  void onNotificationPressed() {
    // Handle notification logic
    notifyListeners();
  }

  void onFilterPressed() {
    // Handle filter logic
    notifyListeners();
  }

  void onSearch(String query) {
    // Handle search logic
    notifyListeners();
  }

}
