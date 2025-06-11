import 'cartao.dart';
import 'cliente.dart';
import 'compra.dart';
import 'conta.dart';
import 'fatura.dart';

void main(List<String> args) {
  var conta = Conta(
    cliente: Cliente(id: '33', cfp: '130', nome: 'Adriel', sobrenome: 'Dias'),
    cartao: Cartao(limite: 1000, numero: '1398', mes: 06, ano: 27, codigo: 627),
    faturas: [
      Fatura(
        compras: [
          Compra(valor: 1231, descricao: 'Monitor', data: '14/05/25'),
          Compra(valor: 1123, descricao: 'mouse', data: '05/06/2025'),
        ],
        mes: 6,
        ano: 2021,
      ),
    ],
  );

  print(conta.faturas[0].compras[1].data);
}
