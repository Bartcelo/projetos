// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:teste/app/my_app.dart';
import 'package:teste/app/view/contact_form_back.dart';

// ignore: use_key_in_widget_constructors
class ContactForm extends StatefulWidget {
  @override
  State<ContactForm> createState() => _ContactFormState();
}

class _ContactFormState extends State<ContactForm> {
  bool state = false;
   final _form = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var mascara = MaskTextInputFormatter(mask: '(##) # ####-####');
    var _back = ContactFormBack(context);

    return Scaffold(
      key: _form,
        appBar: AppBar(
          title: const Text('Formulario de cadastro '),
          actions: [
            IconButton(
              onPressed: () {
                 _form.currentState?.validate();
                _form.currentState?.save();
                 if(_back.isValed){
                  _back.save();
                  Navigator.of(context).pop();
                }
                
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
            child: SingleChildScrollView(
              // padding: const EdgeInsets.only(top: 10, right: 5, left: 5),
              child: Column(
               // mainAxisAlignment: MainAxisAlignment.start,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  TextFormField(
                    
                    // validator: _back.validaname,
                    onSaved: (newValue) => _back.contact?.nome = newValue!,
                    initialValue: _back.contact?.nome,
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
                        )),
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  TextFormField(
                    
                    // validator: _back.validatelefone,
                    onSaved: (newValue) => _back.contact?.telefone = newValue!,
                    initialValue: _back.contact?.telefone,
                    inputFormatters: [mascara],
                    keyboardType: TextInputType.number,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        //  suffixIcon: Icon(Icons.remove_red_eye_rounded),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Telefone',
                        hintText: '(99) 9 9999-9999',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                  Padding(padding: EdgeInsets.all(8.0)),
                  TextFormField(
                    
                    // validator: _back.validainforma,
                    onSaved: (newValue) => _back.contact?.informa = newValue!,
                    initialValue: _back.contact?.informa,
                    cursorColor: Colors.white,
                    decoration: InputDecoration(
                        //  suffixIcon: Icon(Icons.remove_red_eye_rounded),

                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white, width: 2),
                        ),
                        border: OutlineInputBorder(),
                        labelText: 'Informações',
                        labelStyle: TextStyle(
                          color: Colors.white,
                        )),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Colors.green[400],
                    ),
                    onPressed: () {
                      Navigator.of(context).pushNamed(MyApp.CALENDARIO);
                    },
                    child: Text('Data do proximo contato'),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 10,
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                        color: Colors.white,
                        width: 2,
                      )),
                      child: SwitchListTile(
                          tileColor: Colors.black,
                          activeColor: Colors.green,
                          title: const Text(
                            'Revisita',
                            style: TextStyle(color: Colors.white, fontSize: 25),
                          ),
                          value: state,
                          onChanged: (value) {
                            setState(() {
                              state = value;
                            });
                          }),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
