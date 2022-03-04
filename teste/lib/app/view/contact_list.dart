// ignore_for_file: unused_element

import 'dart:math';

import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:teste/app/database/sqlite/dao/contact_dao_impl.dart';
import 'package:teste/app/domin/entities/contact.dart';
import 'package:teste/app/my_app.dart';

// ignore: use_key_in_widget_constructors
class ContactList extends StatefulWidget {
  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
  double _height = 100;
  /* 
  final lista = [
    {'nome':'Marcelo','telefone':'(11) 95339-0695','avatar':'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png'},
    {'nome':'Raiane','telefone':'(11) 95339-4444','avatar':'https://cdn.pixabay.com/photo/2022/01/14/09/09/woman-6936784_960_720.jpg'},
    {'nome':'Joana','telefone':'(11) 95339-5555','avatar':'https://cdn.pixabay.com/photo/2014/04/02/14/10/female-306407_960_720.png'},
   ];*/
  Future<List<Contact>> _buscar() async {
    return ContactDaoImpl().find();

    /*Database? db = await Connection.get();

  /** String path = join(await getDatabasesPath(), 'banco'); 
   Database db = await openDatabase(
     path,
     version: 1,
     onCreate: (db,v){
       db.execute(createTable);
       db.execute(insert);
       db.execute(insert2);
       db.execute(insert3);
     });*/
     return db!.query('contact');
     */
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: _buscar(),
        builder: (context, futuro) {
          if (futuro.hasData) {
            List<Contact> lista = futuro.data as List<Contact>;
            //List<Contact> lista = futuro.data as List;
            return Scaffold(
              appBar: AppBar(
                title: const Text('Lista de Contatos'),
                actions: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pushNamed(MyApp.FORM);
                    },
                    icon: const Icon(Icons.add),
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
                child: ListView.builder(
                  itemCount: lista.length,
                  itemBuilder: (context, i) {
                    var contato = lista[i];
                    var avatar = CircleAvatar(
                      backgroundImage: NetworkImage(contato.id.toString()),
                    );
                    return /**Text(contato['nome'].toString());**/
                        Card(
                      // a linha abaixo altera a cor dos cardes no liste view.
                      // color: Colors.primaries[Random().nextInt(Colors.primaries.length)],
                      color: Colors.black54.withOpacity(0.6),
                      child: Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Column(
                          children: [
                            ListTile(
                              leading: const Icon(Icons.person),
                              title: Text(contato.nome.toString()),
                              // onTap: () {Navigator.of(context).pushNamed(MyApp.FORM);},
                              subtitle: Text(contato.telefone.toString()),
                              isThreeLine: true,
                              iconColor: Colors.white,
                              textColor: Colors.white,
                              trailing: SizedBox(
                                width: 100,
                                child: Row(
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pushNamed(MyApp.FORM);
                                        },
                                        icon: Icon(Icons.edit)),
                                    IconButton(
                                        onPressed: () {},
                                        icon: Icon(Icons.delete))
                                  ],
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                setState(() {
                                  _height == 100
                                      ? _height = 400
                                      : _height = 100;
                                });
                              },
                              child: AnimatedContainer(
                                  padding: const EdgeInsets.all(0),
                                  width: 400,
                                  height: _height,
                                  margin: const EdgeInsets.all(0),
                                  // color: Colors.green,
                                  decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  duration: const Duration(seconds: 2),
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.vertical,
                                    child: Column(
                                      children: [
                                        Text(
                                          " Informações:" +
                                              contato.informa.toString(),
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 15),
                                        ),
                                      ],
                                    ),
                                  )),
                            ),
                            Container(
                              width: 400,
                              padding: const EdgeInsets.all(2),
                              margin: const EdgeInsets.all(2),
                              decoration: BoxDecoration(
                                border:
                                    Border.all(color: Colors.white, width: 2),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(5),
                                ),
                              ),
                              child: Center(
                                child: Text(
                                  "Utimo contato: " + contato.data.toString(),
                                  style: const TextStyle(
                                      color: Colors.greenAccent, fontSize: 15),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            );
          } else {
            return Scaffold();
          }
        });
  }
}
