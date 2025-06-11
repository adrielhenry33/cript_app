import 'pessoa.dart';

class Cliente extends Pessoa {
  String id;
  String cfp;

  Cliente({
    required this.id,
    required this.cfp,
    required String nome,
    required String sobrenome,
  }) : super(nome: nome, Sobrenome: sobrenome);
}
