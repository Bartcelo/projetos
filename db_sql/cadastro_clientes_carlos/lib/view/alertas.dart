import 'package:cadastro_clientes_carlos/models/contato.dart';
import 'package:flutter/material.dart';

import '../database/database_helper.dart';

class Alertas extends StatelessWidget {
  const Alertas({ Key? key }) : super(key: key);
  
  

  @override
  Widget build(BuildContext context) {
    // DatabaseHelper db = DatabaseHelper();
    // List<Contato> contatos = <Contato>[];

    // var valorid = contatos.length;

    return  AlertDialog(
            title: const Text(" Nome"),
            content: const Text("Faltou o nome do contato"),
            actions: [
              ElevatedButton(
                  child: const Text("Fechar"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
  }
}



