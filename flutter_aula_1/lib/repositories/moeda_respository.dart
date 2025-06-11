import 'package:flutter_aula_1/models/moeda.dart';

class MoedaRespository {
  static List<Moeda> tabela = [
    Moeda(
      icone: 'images/bitcoin.png',
      nome: 'Bitcoin',
      sigla: 'BTC',
      preco: 1343211.0,
    ),
    Moeda(
      icone: 'images/etherionn.png',
      nome: 'Etherion',
      sigla: 'ETC',
      preco: 3423.4,
    ),
   
    Moeda(
      icone: 'images/cardano.png',
      nome: 'Cardano',
      sigla: 'ADA',
      preco: 6.32,
    ),
    Moeda(
      icone: 'images/usdc.png',
      nome: 'USD Coin',
      sigla: 'USDC',
      preco: 5.02,
    ),
  ];
}
