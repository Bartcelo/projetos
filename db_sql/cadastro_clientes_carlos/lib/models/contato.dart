// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Contato {
  int? id;
  String nome;
  String empresa;
  String email;
  String instagram;
  int telefone;
  String endereco;
  int numerocasa;
  int cep;
  String img;

  Contato({
    required this.id,
    required this.nome,
    required this.empresa,
    required this.email,
    required this.instagram,
    required this.telefone,
    required this.endereco,
    required this.numerocasa,
    required this.cep,
    required this.img,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'empresa': empresa,
      'email': email,
      'instagram': instagram,
      'telefone': telefone,
      'endereco': endereco,
      'numerocasa': numerocasa,
      'cep': cep,
      'img': img,
    };
  }

  factory Contato.fromMap(Map<String, dynamic> map) {
    return Contato(
      id: map['id'] as int,
      nome: map['nome'] as String,
      empresa: map['empresa'] as String,
      email: map['email'] as String,
      instagram: map['instagram'] as String,
      telefone: map['telefone'] as int,
      endereco: map['endereco'] as String,
      numerocasa: map['numerocasa'] as int,
      cep: map['cep'] as int,
      img: map['img'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Contato.fromJson(String source) => Contato.fromMap(json.decode(source) as Map<String, dynamic>);
}
