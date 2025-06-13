import 'package:flutter_aula_1/pages/favoritas_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_aula_1/pages/moedas_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  int paginaAtual = 0; //indice das paginaAtuals sera implementad Ex.: pag 1 , pag 2
  //A primeira paginaAtual que esta no children é a paginaAtual 0,
  // o PageController faz essa contagem automaticamente,
  // se eu setasse paginaAtual para um ele colocaria na tela
  //a paginaAtual FavoritasPage como a primeira a ser exibidada
  late PageController pageController;

  void setpaginaAtual(int pagina){
    setState(() {
      paginaAtual  = pagina;
    });
  }

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
          MoedasPage(), //quais as paginaAtuals que vão estar no slider
          FavoritasPage(),
        ],
        onPageChanged: (value) {
          setpaginaAtual(value);
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        unselectedFontSize: 15  ,
        selectedFontSize: 15,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.list, color: Colors.indigo),
            label: 'Todas',
          ),
          
          BottomNavigationBarItem(
            icon: Icon(Icons.star, color: Colors.indigo),
            label: "Favoritas",
            
            
          ),
        ],
        onTap: (paginaAtual) {
          pageController.animateToPage(
           paginaAtual,
            duration: Duration(microseconds: 400),
            curve: Curves.ease,
          );
        },
        backgroundColor: Colors.grey[300],
        currentIndex: paginaAtual,
      ),
    );
  }
}
