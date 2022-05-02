// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ffi';

class Conta {

  // atributos
  int numero;
  String tipo;
  String dono;
  Double saldo;
  bool status;
  Conta({
    required this.numero,
    required this.tipo,
    required this.dono,
    required this.saldo,
    required this.status,
  });

  // metodos
  abrirConta() {
    // se conta corrente CC ganha 50
    // se conta poupança CP ganha 150


  }
  fecharConta() {
    //para fechar a conta precisa estar com o saldo igual zero

  }
  depositar() {
    // para depositar a conta tem que estar aberta Status true
  }
  sacar() {
    // para sacar precisa estar com estatus verdadeiro e ter saldo positivo maior que o valor solicitado em conta
  }
  pagarMensal() {
    // CC mensalidade no valor de 12 reais
    // CP mensalidade no valor de 20 reais
  }
}
