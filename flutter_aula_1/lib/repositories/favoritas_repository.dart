import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_aula_1/models/moeda.dart';

class FavoritasRepository extends ChangeNotifier {
  List<Moeda> _lista = [];

  //esse metodo cria uma get da lista mas sem deixar disponivel alguma mudança
  // na lista
  UnmodifiableListView<Moeda> get lista => UnmodifiableListView(_lista);

  void saveAll(List<Moeda> moedas) {
    for (var i = 0; i < moedas.length; i++) {
      if (!_lista.contains(moedas[i])) {
        _lista.add(moedas[i]);
      }
    }
    notifyListeners();
  }

  void remove(Moeda moeda) {
    _lista.remove(moeda);
    notifyListeners();
  }
}
