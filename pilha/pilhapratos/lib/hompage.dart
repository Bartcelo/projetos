// ignore_for_file: avoid_print

import 'package:flutter/material.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  DateTime data = DateTime.now();
  List<Map<String, dynamic>> pilha = [
    {
      'name': "Insira um produto",
      'value': false,
      'time': null
    }
  ];

  final TextEditingController _controller = TextEditingController();
  addpilha() {
    
    var addnapilha = {'name': _controller.text, 'value': true, 'time':data};
    pilha.addAll({addnapilha});
  }

  rempilha() {
    pilha.removeWhere((element) => element['value'] == true);
  }

  muipilha() {}

   datatime(){
    DateTime data = DateTime.now();
    print(data);

    }


 

  var checkvalue = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestor de tarefas diario"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            TextFormField(
              onFieldSubmitted: (value) {
                if (_controller.text == "") {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.green[400],
                          title:const Text(
                              "Por faovor inserir valores no campo Produto" ),
                          actions: [
                            ElevatedButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: const Text("OK"))
                          ],
                        );
                      });
                } else {
                  setState(() {
                    print("Verdadeiro");
                    print(_controller.text);
                    print(pilha);

                    addpilha();
                    pilha.removeWhere(
                    (element) => element['name'] == 'Insira um produto');
                  });
                }
                _controller.clear();
                
              },
              controller: _controller,
              decoration: const InputDecoration(
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.pink, width: 3),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                    icon: const Icon(Icons.add),
                    label: const Text("Add"),
                    onPressed: () {
                      if (_controller.text == "") {
                        showDialog(
                            context: context,
                            builder: (BuildContext context) {
                              return AlertDialog(
                                backgroundColor: Colors.green[400],
                                title: const Text(
                                    "Por faovor inserir valores no campo Produto"),
                                actions: [
                                  ElevatedButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child:const Text("OK"))
                                ],
                              );
                            });
                      } else {
                        setState(() {
                          addpilha();
                          pilha.removeWhere(
                          (element) => element['name'] == 'Insira um produto');
                        });
                      }
                      _controller.clear();
                      
                    }),
                const Padding(padding: EdgeInsets.all(20)),
                ElevatedButton.icon(
                  icon: const Icon(Icons.remove),
                  label: const Text("Rem"),
                  onPressed: () {
                    setState(() {
                      rempilha();
                    });
                  },
                ),
              ],
            ),
            Expanded(
              child: ListView.builder(
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  itemCount: pilha.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      trailing: Checkbox(
                          value: pilha[i]['value'],
                          onChanged: (value) {
                            setState(() {
                              pilha[i]['value'] = value!;
                            });
                          }),
                      tileColor: Colors.green[200],
                      title: Text(pilha[i]['name']),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
