import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:teste/app/domin/entities/contact.dart';
import 'package:teste/app/domin/service/contact_service.dart';
part 'contact_form_back.g.dart';

class ContactFormBack = _ContactFormBack with _$ContactFormBack;

abstract class _ContactFormBack with Store {
  Contact? contact;
  var _service = GetIt.I.get<ContactService>();

bool? _nomeIsValid;
bool? _dataIsValid;
bool? _informaIsValid;
bool? _telefoneIsValid;

bool get isValed => _nomeIsValid! && _dataIsValid!  && _informaIsValid! && _telefoneIsValid!;




  _ContactFormBack(BuildContext context) {
  
  
  
  
    var parameter = ModalRoute.of(context)?.settings.arguments;
    var dia = DateTime.now().day;
    contact = ((parameter == null)
        ? Contact(id: 0, data: dia, informa: '', telefone: '', nome: '')
        : parameter) as Contact?;
  }

  //Salvar dados

  save() async{
    await _service.save(contact!);
  }


  // Validações
String validaNome(String name){
  try {
    _service.validaname(name);
    _nomeIsValid = true;
    return null!;
  } catch (e) {
    _nomeIsValid = false;
    return e as String;
  }
}

String validadata(int data){
  try {
    _service.validadata(data);
    _dataIsValid = true;
    return null!;
  } catch (e) {
    _dataIsValid = false;
    return e as String;
  }
}

String validainforma(String informa){
  try {
    _service.validainforma(informa);
    _informaIsValid = true;
    return null!;
  } catch (e) {
    _informaIsValid = false;
    return e as String;
  }
}
String validatelefone(String telefone){
  try {
    _service.validatelefone(telefone);
    _telefoneIsValid = true;
    return null!;
  } catch (e) {
    _telefoneIsValid = false;
    return e as String;
  }
}



  
}
