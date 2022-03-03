class Contact{
  int id;
  String nome;
  String telefone;
  String informa;
  int data;
  int? revisita;

Contact({required this.id, required this.nome, required this.telefone, required this.informa, required this.data, this.revisita});

  static fromMap(Map<String, Object?> e) {}
}

