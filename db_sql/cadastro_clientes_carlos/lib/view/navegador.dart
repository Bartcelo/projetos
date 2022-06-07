

import 'package:cadastro_clientes_carlos/view/adicionar.dart';
import 'package:cadastro_clientes_carlos/view/color.dart';
import 'package:flutter/material.dart';

import 'homePage.dart';

import 'pedidos.dart';

class Navegador extends StatefulWidget {
  const Navegador({Key? key}) : super(key: key);

  @override
  State<Navegador> createState() => _NavegadorState();
}

class _NavegadorState extends State<Navegador> {

  int _tela = 0;

  Cores cor = Cores();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: cor.corappbar,
        fixedColor: cor.cortexto,
        unselectedItemColor: cor.corfundo,
        currentIndex: _tela,
        elevation: 30,
        onTap: (botton){
          setState(() {
            _tela =botton;
            
          });
        },

        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home", ),
          BottomNavigationBarItem(icon: Icon(Icons.add),  label: "ADD"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart_outlined),label: "Produtos"),
        ],
      ) ,


      body: IndexedStack(
        index: _tela,
        children: const [
          HomePage(),
          Adicionar(),
          Pedidos(),
        ],
      ),
      
    );
    
  }
}