// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:process_run/shell.dart';

Future main() async {
   var shell = Shell();
   //await shell.run("start chrome www.romafla.com.br");

//   final bart = Gato();
//   bart.nome = "Bartolomeu";
//   bart.cor = "Branco";
//   bart.pelo = "Liso";
//   bart.tamanho = 10;

//   final bart1 =Gato()
//   ..nome ="preguissa"
//   ..cor = "Carameo"
//   ..pelo = "enrolado"
//   ..tamanho = 20;   

// print(bart);
// print("-----------------------");
// print(bart1);

final bart2 = getGato()
?..nome ="Marcelo"
..cor = "moreno"
..pelo = "Cabelo"
..tamanho = 180;

print(bart2);

}

Gato? getGato(){
  return Gato();
}

class Gato {

  late String nome;
  late String cor;
  late String pelo;
  late int tamanho;



   @override
   String toString() {
    return 'Gato(nome: $nome, cor: $cor, pelo: $pelo, tamanho: $tamanho)';
   }
}
