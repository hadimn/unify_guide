import 'package:flutter/material.dart';
import 'package:calculator/materials/classes/local_storage.dart';

class ThemeProvider extends ChangeNotifier {
  String _displayMode = "dark";

  String get displayMode => _displayMode;

  ThemeProvider() {
    _loadDisplayMode();
  }

  Future<void> _loadDisplayMode() async {
    String? localMode = await LocalStorageServices.getStringValue("displayMode");
    if (localMode != null && localMode.isNotEmpty) {
      _displayMode = localMode;
    }
    notifyListeners();
  }

  Future<void> toggleDisplayMode() async {
    _displayMode = _displayMode == "dark" ? "light" : "dark";
    await LocalStorageServices.setStringValue("displayMode", _displayMode);
    notifyListeners(); // Notifies all listeners of the change
  }
}
