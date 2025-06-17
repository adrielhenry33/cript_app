import 'package:flutter/material.dart';
import 'package:flutter_aula_1/pages/moedas_detalhes_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter_aula_1/repositories/favoritas_repository.dart';
import 'package:flutter_aula_1/models/moeda.dart';

class MoedaCard extends StatefulWidget {
  final Moeda moeda;

  const MoedaCard({required this.moeda, super.key});

  @override
  State<MoedaCard> createState() => _MoedaCard();
}

late FavoritasRepository favoritas;

class _MoedaCard extends State<MoedaCard> {
  void mostrarDetalhes() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) {
          return MoedasDetalhesPage(moeda: widget.moeda);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    favoritas = context.watch<FavoritasRepository>();

    return Card(
      margin: EdgeInsets.only(top: 12),
      elevation: 2,
      child: InkWell(
        onTap: () {
          return mostrarDetalhes();
        },
        child: Padding(
          padding: EdgeInsets.only(top: 20, bottom: 20, left: 20),
          child: Row(
            children: [
              Image.asset(widget.moeda.icone, height: 40),
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(left: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.moeda.nome,
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        widget.moeda.sigla,
                        style: TextStyle(fontSize: 13, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
