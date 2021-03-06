// ignore_for_file: file_names

import 'package:cadastro_clientes_carlos/view/color.dart';
import 'package:flutter/material.dart';

class AlertaDelete extends StatelessWidget {
  AlertaDelete({Key? key}) : super(key: key);
  Cores cor = Cores();

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Excluir"),
      content: const Text("Confirma Exclusão?"),
      actions: [
        ElevatedButton(child: const Text("SIM"), onPressed: () {}),
        ElevatedButton(
            child: const Text("Não"),
            onPressed: () {
              Navigator.of(context).pop();
            })
      ],
    );
  }
}
