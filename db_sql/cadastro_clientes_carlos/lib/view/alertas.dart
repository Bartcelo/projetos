import 'package:cadastro_clientes_carlos/view/color.dart';
import 'package:flutter/material.dart';

class Alertas extends StatelessWidget {
  Alertas({Key? key}) : super(key: key);
  Cores cor = Cores();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: cor.corappbar,
      title: const Text(
        " Nome",
        style: TextStyle(color: Colors.white),
      ),
      content: const Text(
        "Faltou o nome do contato",
        style: TextStyle(color: Colors.white),
      ),
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
