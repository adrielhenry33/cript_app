import 'package:flutter_aula_1/pages/favoritas_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aula_1/pages/moedas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int paginaAtual = 0; //indice das paginas sera implementad Ex.: pag 1 , pag 2
  //A primeira pagina que esta no children é a pagina 0,
  // o PageController faz essa contagem automaticamente,
  // se eu setasse paginaAtual para um ele colocaria na tela 
  //a pagina FavoritasPage como a primeira a ser exibidada
  late PageController pageController;

  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: paginaAtual);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        children: [
          MoedasPage(), //quais as paginas que vão estar no slider
          FavoritasPage(),
        ],
      ),
    );
  }
}
