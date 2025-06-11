import 'package:flutter/material.dart';
import 'package:flutter_aula_1/models/moeda.dart';

class MoedasDetalhesPage extends StatefulWidget{

  final Moeda moeda;

  const MoedasDetalhesPage({super.key, required this.moeda});

  @override
  State<MoedasDetalhesPage> createState() => _MoedasDetalhesPage();
}

class _MoedasDetalhesPage extends State<MoedasDetalhesPage> {
  @override 
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.moeda.nome ),
      ),
    );
  }
}