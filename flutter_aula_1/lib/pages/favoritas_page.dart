import 'package:flutter/material.dart';
import 'package:flutter_aula_1/models/moeda_card.dart';
import 'package:flutter_aula_1/repositories/favoritas_repository.dart';
import 'package:provider/provider.dart';

class FavoritasPage extends StatefulWidget {
  const FavoritasPage({super.key});

  @override
  State<FavoritasPage> createState() => _FavoritasPage();
}

late FavoritasRepository favoritas;

class _FavoritasPage extends State<FavoritasPage> {
  @override
  Widget build(BuildContext context) {
    favoritas = Provider.of<FavoritasRepository>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
            'Moedas Favoritas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        color: Colors.indigo,
        height: MediaQuery
            .of(context)
            .size
            .height,
        padding: EdgeInsets.all(12.0),
        child: Consumer<FavoritasRepository>(
            builder: (context, favoritas, child) {
              return favoritas.lista.isEmpty ? ListTile(
                leading: Icon(Icons.star, color: Colors.grey,),
                title: Text("Aina não há moedas favoritas"),) :ListView.builder(itemCount: favoritas.lista.length, itemBuilder: (_,index){
                  return MoedaCard(moeda: favoritas.lista[index]);
              });
            }),
      ),
    );
  }
}
