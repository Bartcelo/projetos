// ignore_for_file: unused_element



import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:teste/app/domin/entities/contact.dart';
import 'package:teste/app/my_app.dart';
import 'package:teste/app/view/contact_form_back.dart';
import 'package:teste/app/view/contact_list_back.dart';

// ignore: use_key_in_widget_constructors
class ContactList extends StatefulWidget {
  @override
  State<ContactList> createState() => _ContactListState();
}

class _ContactListState extends State<ContactList> {
   double _height = 50;

  final _contactBack = ContactListBack();
  // ignore: prefer_final_fields
  /* 
  final lista = [
    {'nome':'Marcelo','telefone':'(11) 95339-0695','avatar':'https://cdn.pixabay.com/photo/2013/07/13/10/07/man-156584_960_720.png'},
    {'nome':'Raiane','telefone':'(11) 95339-4444','avatar':'https://cdn.pixabay.com/photo/2022/01/14/09/09/woman-6936784_960_720.jpg'},
    {'nome':'Joana','telefone':'(11) 95339-5555','avatar':'https://cdn.pixabay.com/photo/2014/04/02/14/10/female-306407_960_720.png'},
   ];*/
  // Future<List<Contact>> _buscar() async {
  //   return ContactDaoImpl().find();
  //    }
  //   /*Database? db = await Connection.get();

  // /** String path = join(await getDatabasesPath(), 'banco');
  //  Database db = await openDatabase(
  //    path,
  //    version: 1,
  //    onCreate: (db,v){
  //      db.execute(createTable);
  //      db.execute(insert);
  //      db.execute(insert2);
  //      db.execute(insert3);
  //    });*/
  //    return db!.query('contact');
  //    */

  

  Widget iconEditButton (VoidCallback onPressed){
    return IconButton(icon: Icon(Icons.edit),onPressed: onPressed);
  }

  Widget iconDelete(BuildContext context,Function delete ){
    return IconButton(icon: Icon(Icons.delete), color: Colors.red ,onPressed:(){
      showDialog(context: context, builder: (context)=>AlertDialog(
        title: Text("Excluir"),
        content: Text("Confirmar Exclusão?"),
        actions: [
          TextButton(child: Text("Não"), onPressed: (){Navigator.of(context).pop();}),
          TextButton(child: Text("Sim"), onPressed: (){delete();} ),
        ],
      ));
    }  );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Lista de Contatos'),
          actions: [
            IconButton(
              onPressed: () {
               _contactBack.goToForm(context);
              },
              icon: const Icon(Icons.add),
            )
          ],
        ),
        body: Observer(builder: (context) {
          return Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomRight,
                end: Alignment.topLeft,
                colors: [Colors.black, Colors.green],
              ),
            ),
            child: FutureBuilder(
                future: _contactBack.list,
                builder: (context, futuro) {
                  if (!futuro.hasData) {
                    return const CircularProgressIndicator();
                  } else {
                    List<Contact> lista = futuro.data as List<Contact>;
                    //List<Contact> lista = futuro.data as List;
                    return ListView.builder(
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
                                        iconEditButton((){
                                          _contactBack.goToForm(context, contato);
                                        }),
                                        iconDelete(context, (){_contactBack.remove(contato.id); Navigator.of(context).pop();})
                                      ],
                                    ),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      _height == 400
                                          ? _height =
                                              MediaQuery.of(context).size.height *
                                                  0.5
                                          : _height = 50;
                                    });
                                  },
                                  child: AnimatedContainer(
                                      padding: const EdgeInsets.all(0),
                                      width: 400,
                                      height: 100,
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
                                              " Informações: Verificar se esta tudo funcionando Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem. Ut enim ad minima veniam, quis nostrum exercitationem ullam corporis suscipit laboriosam, nisi ut aliquid ex ea commodi consequatur? Quis autem vel eum iure reprehenderit qui in ea voluptate velit esse quam nihil molestiae consequatur, vel illum qui dolorem eum fugiat quo voluptas nulla pariatur?" +
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
                                    border: Border.all(
                                        color: Colors.white, width: 2),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(5),
                                    ),
                                  ),
                                  child: Center(
                                    child: Text(
                                      "Utimo contato: " +
                                          contato.data.toString(),
                                      style: const TextStyle(
                                          color: Colors.greenAccent,
                                          fontSize: 15),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  }
                }),
          );
        }));
  }
}
