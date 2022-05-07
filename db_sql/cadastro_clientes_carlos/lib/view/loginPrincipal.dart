// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:cadastro_clientes_carlos/view/color.dart';
import 'package:flutter/material.dart';

import '../controller/loginControle.dart';

class LoginPrincipal extends StatelessWidget {
  final LoginControle _controle = LoginControle();

  LoginPrincipal({Key? key}) : super(key: key);
  Cores cor = Cores();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: cor.corfundo,
      appBar: AppBar(
        backgroundColor: cor.corappbar,
        title: const Center(child: Text("Bartcelo")),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              const Padding(
                padding: EdgeInsets.all(10),
                child: Icon(
                  Icons.people,
                  size: 50,
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  onChanged: _controle.setEmpresa,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Digite o nome da empresa",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  onChanged: _controle.setEmail,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Digite seu e-mail",
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(10),
                child: TextField(
                  obscureText: true,
                  keyboardType: TextInputType.visiblePassword,
                  onChanged:  _controle.setPass,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: "Digite uma senha",
                    
                  ),
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
                    _controle.auth().then((value) {
                        if (true) {
                          Navigator.of(context).pushReplacementNamed('/homePag');
                        // ignore: dead_code
                        } else {
                          Navigator.of(context).pushReplacementNamed('/');
                        }
        
                    });
                  },
                  child: const Text('Continuar'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
