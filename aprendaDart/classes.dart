void main() {

  final c = Cliente();
  final a = Aluno();


assert(a.nome == "Raiane");

print(c.nome);
print(a.nome);
print(c.teste());
print(a.teste());
a.estudante();
a.compra();
 assert(c.nome == "marcelo");
 assert(c.email == "marcelo@");

}


class Cliente {
  String nome  = "nome";
  String email = "@";

String teste(){
  return "123";
}

}

class Aluno extends Cliente with Estudante, Compra {
@override
String nome = "Gonzaga";
String email = "@Gonzaga";
String teste(){
  return "Marli";
}

}

 mixin  Estudante{
  estudante() => print("estudando");
}

mixin Compra{
 compra() => print("comprando doces");

}



// entendendo extends com classes. A classe filha herda os metodos e atributos/propriedades da classe Pai.

/*
class Aluno extends Cliente{

 @override
 String nome = "Crianca";
 String teste (){
   return  super.teste() + " 456";
 }

}*/