// ignore_for_file: dead_code

import 'package:cadastro_clientes_carlos/models/contato.dart';
import 'package:cadastro_clientes_carlos/view/alertas.dart';
import 'package:cadastro_clientes_carlos/view/color.dart';
import 'package:flutter/material.dart';
import 'package:cadastro_clientes_carlos/database/database_helper.dart';
import 'package:flutter/services.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class CadastraPedido extends StatefulWidget {
  // const ContatoPage({ Key? key }) : super(key: key);

  final Contato? contato;
  // ignore: use_key_in_widget_constructors
  const CadastraPedido({this.contato});

  @override
  State<CadastraPedido> createState() => _CadastraPedidoState();
}

class _CadastraPedidoState extends State<CadastraPedido> {
  // mascaras de textfild
   var mascaratel = MaskTextInputFormatter(mask:'(##) # ####-####');



  Cores cor = Cores();

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
      backgroundColor: cor.corfundo,
      appBar: AppBar(
        backgroundColor: cor.corappbar,
        title: Text(
            _editacontato?.nome == '' ? "Novo contato" : _editacontato!.nome),
      ),
      floatingActionButton: FloatingActionButton(
         heroTag: "btn2",
        onPressed: () {
          // ignore: unnecessary_null_comparison
          if (_editacontato!.nome != null && _editacontato!.nome.isNotEmpty) {
           // Navigator.pop(context, _editacontato);
          } else {
            _exibeaviso();
            FocusScope.of(context).requestFocus(_focusNome);
          }
        },
        backgroundColor: cor.corappbar,
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
                  BoxDecoration(shape: BoxShape.circle, color: cor.cortexto),
              child: Image.asset("assets/img/pessoa.png"),
            ),
           
            TextField(
              maxLength: 11,
               maxLengthEnforcement: MaxLengthEnforcement.enforced,
              controller: _telefonecontrole,
              decoration: const InputDecoration(labelText: "Codigo"),
              onChanged: (text) {
                editado = true;

                var valor = int.parse(text);
                _editacontato!.telefone = valor;
              },
              keyboardType: TextInputType.phone,
            ),
             TextField(
                focusNode: _focusNome,
                controller: _nomecontrole,
                decoration: const InputDecoration(labelText: "Produto"),
                onChanged: (text) {
                  editado = true;
                  setState(() {
                    _editacontato!.nome = text;
                  });
                }),
            TextField(
              controller: _empresacontrole,
              decoration: const InputDecoration(labelText: "Quantidade"),
              onChanged: (text) {
                editado = true;
                _editacontato!.empresa = text;
              },
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
          return  Alertas();
        });
  }
}
