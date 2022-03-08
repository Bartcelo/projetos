//Simblos
// print(#marcelo);

void main(List<String> arguments) {
// estudando Funções

// No dart temos um tipo expecifico para Função "Function" que é uma classe abstrata.
  // ignore: prefer_function_declarations_over_variables
  void Function() minhafuncao = () {
    print("Mensagem da minha função");
  };

  // ignore: prefer_function_declarations_over_variables
  // num Function (num ,num , num ) soma = (num v1, num v2, num v3){
  //   return v1 + v2+ v3 ;
  // };
  String leia(String v1, String v2, String v3) {
    return v1 + v2 + v3;
  }

  num soma(num v1, num v2, num v3) => v1 + v2 + v3;

  minhafuncao();
  print(leia("Marcelo ", "Ama ", "Raiane."));
  print(soma(1, 2, 3));
  longinsenha("marcelo", "madagascar");
  longinsenha("marcelo");
  addUser(
      nome: "Raiane",
      senha: "9876",
      email: "raiane@email.com",
      idade: 25,
      cep: "08080-000");
}

// Função com o tipo
// void longinsenha (String email, String senha){
// print("=> $email $senha");
// }

// Função sem o tipo
// A função sem o tipo não ajuda na documentação no caso de uso futuro o tipo pode ser de ajuda no entendimento da função;

void longinsenha(String email, [String? senha]) {
  print("=> $email ${senha ?? '123'}");
}

void addUser({required String nome, required String senha, required String email, required int idade, required String cep}) {
  
    print("Adicionar Usuario: $nome, $senha, $email, $idade, $cep");

}
