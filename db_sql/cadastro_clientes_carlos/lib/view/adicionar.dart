

import 'package:flutter/material.dart';

import '../database/database_helper.dart';
import '../models/contato.dart';
import 'color.dart';
import 'contato_page.dart';

class Adicionar extends StatefulWidget {
  const Adicionar({Key? key}) : super(key: key);

  @override
  State<Adicionar> createState() => _AdicionarState();
}

class _AdicionarState extends State<Adicionar> {

DatabaseHelper db = DatabaseHelper();
  List<Contato> contatos = <Contato>[];


   Cores cor = Cores();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        
        centerTitle: true,
        title: const Text(
          "BartCelo",
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: cor.corappbar,
      ),
      backgroundColor: cor.corfundo,
      body:SafeArea(
        child: Center(
          child:Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(MediaQuery.of(context).size.width, 60),
                          textStyle: TextStyle(color: cor.corappbar),
                          primary: cor.corappbar),
                      onPressed: () {
                       _exibaContatoPage();
                      },
                      child: const Text('Cliente'),
                    ),
                  ),
                   Padding(
                    padding: const EdgeInsets.all(10),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          minimumSize: Size(MediaQuery.of(context).size.width, 60),
                          textStyle: TextStyle(color: cor.corappbar),
                          primary: cor.corappbar),
                      onPressed: () {
                      Navigator.of(context).pushNamed('/cadastraPedido');
                      },
                      child: const Text('Produto'),
                    ),
                  ),
            ],
          ),
          
        ),
      ),
    );
    
  }



void _exibaContatoPage({Contato? contato}) async {
    final contatoRecebido = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (context) => ContatoPage(
                  contato: contato,
                )));
    if (contatoRecebido != null) {
      if (contato != null) {
        await db.atualizaContato(contatoRecebido);
      } else {
        db.insertContato(contatoRecebido);
      }
      _exibeContatos();
    }
  }

  _exibeContatos() {
    db.getContatos(contatos).then((lista) {
      setState(() {
        contatos = lista;
      });
    });
  }

}