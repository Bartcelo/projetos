import 'package:flutter/material.dart';

import '../models/produtos.dart';
import 'color.dart';

class Pedidos extends StatefulWidget {
  const Pedidos({Key? key}) : super(key: key);

  @override
  State<Pedidos> createState() => _PedidosState();
}

class _PedidosState extends State<Pedidos> {


List<Produtos> product = [
  Produtos(codigo: 01, name: "Capsulas Reconstrutoras Treat Hair Plus cx 30und", validar: true),
  Produtos(codigo: 02, name: "Capsulas Reconstrutoras Treat Hair Plus cx 30und", validar: false),
  Produtos(codigo: 03, name: "Capsulas Reconstrutoras Treat Hair Plus cx 30und", validar: false),
 ];

List<Produtos> selectdproduct = [];

  Cores cor = Cores();
   bool _valida = true;



  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Pedido",
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: cor.corappbar,
      ),
      backgroundColor: cor.corfundo,
      floatingActionButton: FloatingActionButton(
         heroTag: "btn3",
        backgroundColor: cor.corappbar,
        onPressed: () {},
        child: const Icon(Icons.picture_as_pdf_rounded),
      ),
      body: ListView.builder(
          itemCount: product.length,
          itemBuilder: (context, index) {
            return CheckboxListTile(
              title: Text(product[index].name!, style: const TextStyle(fontSize: 22),),
              subtitle:Text( " Codigo: " + product[index].codigo.toString(), style: const TextStyle(fontSize: 15), ),
              value:_valida, onChanged: (value){
              setState(() {
               product[index].validar = !product[index].validar; 
                if( product[index].validar == true){
                  selectdproduct.add(Produtos(validar: true, name: product[index].name, codigo: product[index].codigo));
                }else if (product[index].validar == false ){
                    selectdproduct.removeWhere((element) => element.codigo == product[index].codigo);
                }
              });
            });
          }),
    );
  }
}
