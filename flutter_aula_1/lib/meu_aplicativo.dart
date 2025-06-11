import 'package:flutter/material.dart';
import 'package:flutter_aula_1/pages/moedas_page.dart';

class MeuAplicativo extends StatelessWidget{
  const MeuAplicativo ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Moedabase',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.indigo
      ),
      home: MoedasPage(),
    );
  }
}