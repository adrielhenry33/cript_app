import 'package:flutter/material.dart';

class FavoritasPage extends StatefulWidget {
  const FavoritasPage({super.key});

  @override
  State<FavoritasPage> createState() => _FavoritasPage();
}

class _FavoritasPage extends State<FavoritasPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Moedas Favoritas', style: TextStyle(color: Colors.white)),
        backgroundColor: Colors.indigo,
      ),
      body: PageView(children: [

        ],
      ),
    );
  }
}
