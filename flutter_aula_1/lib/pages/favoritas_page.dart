import 'package:flutter/material.dart';
import 'package:flutter_aula_1/models/moeda_card.dart';
import 'package:flutter_aula_1/repositories/favoritas_repository.dart';
import 'package:provider/provider.dart';
import 'package:flutter_aula_1/models/moeda.dart';

class FavoritasPage extends StatefulWidget {
  const FavoritasPage({super.key});

  @override
  State<FavoritasPage> createState() => _FavoritasPage();
}

late FavoritasRepository favoritas;

Future<List<Moeda>> _carregarFavoritas() async {
  final box = favoritas.box;
  List<Moeda> lista = [];

  for (var key in box.keys) {
    final moeda = await box.get(key);
    if (moeda != null) {
      lista.add(moeda);
    }
  }

  return lista;
}


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
        height: MediaQuery.of(context).size.height,
        padding: EdgeInsets.all(12.0),
        child: FutureBuilder(
          future: _carregarFavoritas(),
          builder: (context, snapshot) {
            if (!snapshot.hasData) {
              return Center(child: CircularProgressIndicator());
            }

            final favoritas = snapshot.data as List<Moeda>;

            if (favoritas.isEmpty) {
              return ListTile(
                onLongPress: (){
                },

                leading: Icon(Icons.star, color: Colors.grey),
                title: Text("Ainda não há moedas favoritas", style: TextStyle(color: Colors.white)),
              );
            }

            return ListView.builder(

              itemCount: favoritas.length,
              itemBuilder: (_, index) {
                return MoedaCard(moeda: favoritas[index]);
              },
            );
          },
        ),
      ),

    );
  }
}
