import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_aula_1/adapter/moeda_hive_adapter.dart';
import 'package:flutter_aula_1/models/moeda.dart';
import 'package:hive_flutter/hive_flutter.dart';

class FavoritasRepository extends ChangeNotifier {
  final List<Moeda> _lista = [];

  late LazyBox box;

  FavoritasRepository() {
    _startRepository();
  }

  void _startRepository() async {
    await _openBox();
    await _readFavoritas();
  }

   _openBox() async {
    Hive.registerAdapter(MoedaHiveAdapter());
    box = await Hive.openLazyBox<Moeda>('moedas_favoritas');
  }
  _readFavoritas() {
    box.keys.forEach((moeda) async {
      Moeda m = await box.get(moeda);
      _lista.add(m);
      notifyListeners();
    });
  }
  UnmodifiableListView<Moeda> get lista => UnmodifiableListView(_lista);

  saveAll(List<Moeda> moedas){
    for(int i = 0; i<moedas.length; i++) {
      if(!_lista.any((atual) => atual.sigla == moedas[i].sigla)){
        _lista.add(moedas[i]);
        box.put(moedas[i].sigla, moedas[i]);
      }
    }
    notifyListeners();
  }

  remove(Moeda moeda){
    _lista.remove(moeda);
    box.delete(moeda.sigla);
    notifyListeners();
  }


}


