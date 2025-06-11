import 'package:flutter/material.dart';
import 'package:flutter_aula_1/repositories/moeda_respository.dart';
import 'package:intl/intl.dart';
import 'package:flutter_aula_1/models/moeda.dart';

class MoedasPage extends StatefulWidget {
  const MoedasPage({super.key});

  @override
  State<MoedasPage> createState() => _MoedasPageState();
}

class _MoedasPageState extends State<MoedasPage> {
  final tabela = MoedaRespository.tabela;
  List<Moeda> selecionadas = [];
  List<Moeda> favoritas = [];
  NumberFormat real = NumberFormat.currency(locale: 'pt_Br', name: 'R\$');

  appBarDinamica() {
    if (selecionadas.isEmpty) {
      return AppBar(
        title: Text('Cripto Moedas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
        centerTitle: true,
      );
    } else {
      return AppBar(
        leading: IconButton(
          onPressed: () {
            setState(() {
              selecionadas = [];
            });
          },
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          '${selecionadas.length} selicionadas',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
          
        ),
        backgroundColor: Colors.red.shade400,
        centerTitle: true,
        elevation: 1,
        iconTheme: IconThemeData(color: Colors.black87),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: appBarDinamica(),

      body: ListView.separated(
        itemCount: tabela.length,
        padding: EdgeInsets.all(16),
        separatorBuilder: (_, _) => Divider(),

        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            tileColor: Colors.white,
            selectedColor: Colors.lightBlue[100],
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
            ),

            leading:
                (selecionadas.contains(tabela[index]))
                    ? CircleAvatar(child: Icon(Icons.check))
                    : SizedBox(
                      width: 40,
                      child: Image.asset(tabela[index].icone),
                    ),

            title: Text(
              tabela[index].nome,
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
            ),
            trailing: Text(real.format(tabela[index].preco)),
            selected: selecionadas.contains(tabela[index]),
            selectedTileColor: Colors.indigo[50],
            onLongPress: () {
              setState(() {
                if (selecionadas.contains(tabela[index])) {
                  selecionadas.remove(tabela[index]);
                } else {
                  selecionadas.add(tabela[index]);
                }
              });
            },
          );
        },
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: 
      selecionadas.isNotEmpty ? 
      FloatingActionButton.extended(
        onPressed: () {
          for (var i = 0; i < selecionadas.length; i++) {
            if (favoritas.contains(selecionadas[i])) {
              continue;
            } else {
              favoritas.add(selecionadas[i]);
              break;
            }

          }
        },
        label: Text(
          'FAVORITAR',
          style: TextStyle(
            color: Colors.white,
            letterSpacing: 0,
            fontWeight: FontWeight.bold,
          ),
        ),
        icon: Icon(Icons.star, color: Colors.white),
        backgroundColor: Colors.indigo,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),
        ),
      ):null,
    );
  }
}
