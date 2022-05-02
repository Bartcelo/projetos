import 'package:cadastro_clientes_carlos/database/database_helper.dart';
import 'package:cadastro_clientes_carlos/models/contato.dart';
import 'package:cadastro_clientes_carlos/view/contato_page.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const Color corappbar = Color(0xff4f1567);
  static const Color corfundo = Color(0xffeeccb4);
  static const Color cortexto = Color(0xff116873);

  DatabaseHelper db = DatabaseHelper();
  List<Contato> contatos = <Contato>[];

  @override
  void initState() {
    super.initState();

    // Contato a = Contato(id: 1, nome: "Marli", empresa: "empresa", email: "email", instagram: "instagram", telefone: 123456789, endereco: "endereco", numerocasa: 93, cep: 08507150, img: "img.jpg");
    //db.insertContato(a);

    //Contato b = Contato (id: 02, nome: "Raiane", empresa: "empresa", email: "email", instagram: "instagram", telefone: 123456789, endereco: "endereco", numerocasa: 93, cep: 08507150, img: "img.jpg");
//db.insertContato(b);
    _exibeContatos();

    db.getContatos(contatos).then((lista) {
      // print(lista[2].id);
    });
  }

  _exibeContatos() {
    db.getContatos(contatos).then((lista) {
      setState(() {
        contatos = lista;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Cadastros Marlen",
          style: TextStyle(fontSize: 30),
        ),
        backgroundColor: corappbar,
      ),
      backgroundColor: corfundo,
      floatingActionButton: FloatingActionButton(
        backgroundColor: corappbar,
        onPressed: () {
          _exibaContatoPage();
        },
        child: const Icon(Icons.add),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: contatos.length,
        itemBuilder: (context, index) {
          return _lisataContato(context, index);
        },
      ),
    );
  }

  Widget _lisataContato(BuildContext context, int index) {
    return GestureDetector(
      onTap: () {
        _exibaContatoPage(contato: contatos[index]);
      },

      // ignore: prefer_const_constructors
      child: Card(
        color: corappbar,
        child: Padding(
          padding: const EdgeInsets.all(3.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: 70,
                height: 70,
                decoration: const BoxDecoration(
                    shape: BoxShape.circle, color: cortexto),
                child: Image.asset("assets/img/pessoa.png"),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    contatos[index].nome,
                    style: const TextStyle(fontSize: 22, color: corfundo),
                  ),
                  Text(
                    contatos[index].telefone.toString(),
                    style: const TextStyle(fontSize: 15, color: corfundo),
                  ),
                ],
              ),
              IconButton(
                icon: const Icon(Icons.delete, color: corfundo,),
                onPressed: () {
                  setState(() {
                    _exibeavisodelete(context, contatos[index].id!, index);
                  });
                },
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

  void _exibeavisodelete(BuildContext context, int contatoid, index) {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return
              // AlertaDelete();

              AlertDialog(
                backgroundColor: corappbar,
                
            title: const Text("Excluir", style: TextStyle(color: Colors.white)),
            content: const Text("Confirma Exclusão?", style: TextStyle(color: Colors.white),),
            actions: [
              ElevatedButton(
                
                  child: const Text("SIM"),
                  onPressed: () {
                    setState(() {
                      contatos.removeAt(index);
                      db.deletaContato(contatoid);
                    });
                    Navigator.of(context).pop();
                  }),
              ElevatedButton(
                  child: const Text("Não"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  })
            ],
          );
        });
  }
}
