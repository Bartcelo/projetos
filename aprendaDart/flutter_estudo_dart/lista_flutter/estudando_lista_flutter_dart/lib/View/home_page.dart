import 'package:flutter/material.dart';

List<String> listaNome = ["Raiane", "Marcelo", "Marli", "Boaz"];

List<Widget> listaWidget = listaNome.map((nome) => ListTile(title: Text(nome),leading:const Icon (Icons.person) ,tileColor: Colors.red[100],)).toList();



// List<Widget> ListaWidget = [
//   ListTile(title: Text(listaNome[0]),leading:Icon (Icons.person) ,tileColor: Colors.red[100],),
//   ListTile(title: Text(listaNome[1]),leading:Icon (Icons.person) ,tileColor: Colors.red[100],),
//   ListTile(title: Text(listaNome[2]),leading:Icon (Icons.person) ,tileColor: Colors.red[100],),
//   ListTile(title: Text(listaNome[3]),leading:Icon (Icons.person) ,tileColor: Colors.red[100],),
// ];

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Lista em Flutter'),
        centerTitle: true,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [...listaWidget],
        ),
      ),
    );
  }
}
