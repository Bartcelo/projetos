// ignore_for_file: dead_code

import 'package:cadastro_clientes_carlos/models/contato.dart';
import 'package:cadastro_clientes_carlos/view/alertas.dart';
import 'package:flutter/material.dart';
import 'package:cadastro_clientes_carlos/database/database_helper.dart';

class ContatoPage extends StatefulWidget {
  // const ContatoPage({ Key? key }) : super(key: key);

  final Contato? contato;
  // ignore: use_key_in_widget_constructors
  const ContatoPage({this.contato});

  @override
  State<ContatoPage> createState() => _ContatoPageState();
}

class _ContatoPageState extends State<ContatoPage> {
  static const Color corappbar = Color(0xff4f1567);
  static const Color corfundo = Color(0xffeeccb4);
  static const Color cortexto = Color(0xff116873);

  final _nomecontrole = TextEditingController();
  final _telefonecontrole = TextEditingController();
  final _empresacontrole = TextEditingController();
  final _emailcontrole = TextEditingController();
  final _instagramcontrole = TextEditingController();
  final _enderecocontrole = TextEditingController();
  final _numerocasacontrole = TextEditingController();
  final _cepcontrole = TextEditingController();
  final _imgcontrole = TextEditingController();

  final _focusNome = FocusNode();
  DatabaseHelper db = DatabaseHelper();
  List<Contato> contatos = <Contato>[];

  bool editado = false;
  Contato? _editacontato;

  @override
  void initState() {
    super.initState();
    if (widget.contato == null) {
      _editacontato = Contato(
          id: null,
          nome: "",
          empresa: "",
          email: "",
          instagram: "",
          telefone: 0,
          endereco: "",
          numerocasa: 0,
          cep: 0,
          img: "");
    } else {
      _editacontato = Contato.fromMap(widget.contato!.toMap());
      _nomecontrole.text = _editacontato!.nome;
      _telefonecontrole.text = _editacontato!.telefone.toString();
      _empresacontrole.text = _editacontato!.empresa;
      _emailcontrole.text = _editacontato!.email;
      _instagramcontrole.text = _editacontato!.instagram;
      _enderecocontrole.text = _editacontato!.endereco;
      _numerocasacontrole.text = _editacontato!.numerocasa.toString();
      _cepcontrole.text = _editacontato!.cep.toString();
      _imgcontrole.text = _editacontato!.img;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: corfundo,
      appBar: AppBar(
        backgroundColor: corappbar,
        title: Text(
            _editacontato?.nome == '' ? "Novo contato" : _editacontato!.nome),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // ignore: unnecessary_null_comparison
          if (_editacontato!.nome != null && _editacontato!.nome.isNotEmpty) {
            Navigator.pop(context, _editacontato);
          } else {
            _exibeaviso();
            FocusScope.of(context).requestFocus(_focusNome);
          }
        },
        backgroundColor: corappbar,
        child: const Icon(Icons.save),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Container(
              width: 70,
              height: 70,
              decoration:
                  const BoxDecoration(shape: BoxShape.circle, color: cortexto),
              child: Image.asset("assets/img/pessoa.png"),
            ),
            TextField(
                focusNode: _focusNome,
                controller: _nomecontrole,
                decoration: const InputDecoration(labelText: "Nome"),
                onChanged: (text) {
                  editado = true;
                  setState(() {
                    _editacontato!.nome = text;
                  });
                }),
            TextField(
              controller: _telefonecontrole,
              decoration: const InputDecoration(labelText: "Telefone"),
              onChanged: (text) {
                editado = true;

                var valor = int.parse(text);
                _editacontato!.telefone = valor;
              },
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _empresacontrole,
              decoration: const InputDecoration(labelText: "Empresa"),
              onChanged: (text) {
                editado = true;
                _editacontato!.empresa = text;
              },
            ),
            TextField(
              controller: _emailcontrole,
              decoration: const InputDecoration(labelText: "Email"),
              onChanged: (text) {
                editado = true;
                _editacontato!.email = text;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _instagramcontrole,
              decoration: const InputDecoration(labelText: "Instagram"),
              onChanged: (text) {
                editado = true;
                _editacontato!.instagram = text;
              },
              keyboardType: TextInputType.emailAddress,
            ),
            TextField(
              controller: _enderecocontrole,
              decoration: const InputDecoration(labelText: "Endereço"),
              onChanged: (text) {
                editado = true;
                _editacontato!.endereco = text;
              },
            ),
            TextField(
              controller: _numerocasacontrole,
              decoration: const InputDecoration(labelText: "N°"),
              onChanged: (text) {
                editado = true;

                var valor = int.parse(text);
                _editacontato!.numerocasa = valor;
              },
              keyboardType: TextInputType.phone,
            ),
            TextField(
              controller: _cepcontrole,
              decoration: const InputDecoration(labelText: "CEP"),
              onChanged: (text) {
                editado = true;

                var valor = int.parse(text);
                _editacontato!.cep = valor;
              },
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
      ),
    );
  }

  void _exibeaviso() {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const Alertas();
        });
  }
}
