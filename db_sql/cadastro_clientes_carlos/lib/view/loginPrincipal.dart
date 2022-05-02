// ignore_for_file: avoid_unnecessary_containers, prefer_const_constructors

import 'package:flutter/material.dart';

import '../controller/loginControle.dart';

class LoginPrincipal extends StatelessWidget {
  final LoginControle _controle = LoginControle();

  LoginPrincipal({Key? key}) : super(key: key);
  static const Color corappbar = Color(0xff4f1567);
  static const Color corfundo = Color(0xffeeccb4);
  static const Color cortexto = Color(0xff116873);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corfundo,
      appBar: AppBar(
        backgroundColor: corappbar,
        title: const Center(child: Text("Bartcelo")),
      ),
      body: Container(
        padding: const EdgeInsets.all(15),
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
                onChanged: _controle.setPass,
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
                    textStyle: const TextStyle(color: corappbar),
                    primary: corappbar),
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
    );
  }
}