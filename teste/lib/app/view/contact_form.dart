import 'package:flutter/material.dart';

class ContactForm extends StatefulWidget {

  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  bool state = false;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Formulario de cadastro '),
      actions: [
          IconButton(onPressed: (){
          },
           icon: const Icon(Icons.save),
           )
        ],
    ),
    body: Container(
      decoration: const BoxDecoration(
          gradient: LinearGradient(
                    begin: Alignment.bottomRight,
                    end: Alignment.topLeft,
                    colors: [Colors.black, Colors.green],
                  ),
        ),
      child: Center(
       child: Padding(
         padding: const EdgeInsets.only(top: 10,right: 5,left: 5),
         child: Column(
           // ignore: prefer_const_literals_to_create_immutables
           children: [
             const TextField(
               decoration: InputDecoration(
                 enabledBorder: OutlineInputBorder(
                   
                   borderSide: BorderSide(color: Colors.white, width: 2), 
                   
                 ),
                 border: OutlineInputBorder(
                   borderSide: BorderSide(color: Colors.white, width: 2),
                 ),
                 labelText: 'Nome',
                 labelStyle: TextStyle(
                   color: Colors.white,
                 )
               ),
             ),
             Padding(padding: EdgeInsets.all(8.0)),
             const TextField(
               keyboardType: TextInputType.number,
               cursorColor: Colors.white,
               decoration: InputDecoration(
                 suffixIcon: Icon(Icons.remove_red_eye_rounded),
                 
                 enabledBorder: OutlineInputBorder(
                   
                   borderSide: BorderSide(color: Colors.white, width: 2), 
                 ),
                 border: OutlineInputBorder(),
                 labelText: 'Telefone',
                 labelStyle: TextStyle(
                   color: Colors.white,
                 )
               ),
             ),


            Padding(
              padding: const EdgeInsets.only(top: 10,),
              child: Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.white,width: 2,
                  )
                ),
                child: SwitchListTile(
                  tileColor: Colors.black,
                  activeColor: Colors.green,
                  title: const Text('Revisita', style: TextStyle(color: Colors.white,fontSize: 25),),
                  value: state, 
                onChanged: (value){
                  setState(() {
                    state =value;
                  });
                }),
              ),
            )



            
           ],
         ),
       ),
      ),
    )
  );
   
  }
}