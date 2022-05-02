
import 'package:flutter/material.dart';



class Alertas extends StatelessWidget {
  const Alertas({ Key? key }) : super(key: key);
  static const Color corappbar = Color(0xff4f1567);
  static const Color corfundo = Color(0xffeeccb4);
  static const Color cortexto = Color(0xff116873);
  
  

  @override
  Widget build(BuildContext context) {
   

    return  AlertDialog(
      backgroundColor: corappbar,
            title: const Text(" Nome", style: TextStyle(color: Colors.white),),
            content: const Text("Faltou o nome do contato",style: TextStyle(color: Colors.white),),
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



