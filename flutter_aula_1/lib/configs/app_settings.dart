import 'package:flutter/material.dart';
import 'package:hive/hive.dart';

class AppSettings extends ChangeNotifier {
  late Box box; // tipo de variavela pra incializar o hive

  Map<String, String> locale = {'locale': 'pt_BR', 'name': 'R\$'};

  AppSettings() {
    _startSettings();
  }

  void _startSettings() async {
    await _startPreferences();
    await _readLocale();
  }

  Future<void> _startPreferences() async {
    box = await Hive.openBox('preferencias');

  }
  Future<void> _readLocale() async {
    final local = box.get('local') ?? 'pt_BR';
    final name = box.get('name') ?? 'R\$';
    locale = {'locale': local, 'name': name};
    notifyListeners();
  }


  void setLocale(String local, String name) async {
    await box.put('local', local);
    await box.put('name', name);
    await _readLocale();
  }
}
