
import 'package:flutter/cupertino.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';
import 'package:teste/app/domin/entities/contact.dart';
import 'package:teste/app/domin/service/contact_service.dart';
import 'package:teste/app/my_app.dart';
 part 'contact_list_back.g.dart';

 class ContactListBack  = _ContactListBack with _$ContactListBack;


 abstract class _ContactListBack  with Store {
   var _service = GetIt.I.get<ContactService>();
  

  // lista contatos
  @observable
  Future<List<Contact>>? list;


  // atualizar lista de contatos
  @action
  refreshList([dynamic value]){

    list =_service.find();
  }

  _ContactListBack (){
    refreshList();
  }


  // metodo para chamar o form salvar/alterar

  goToForm(BuildContext context, [Contact? contact]){
 Navigator.of(context).pushNamed(MyApp.FORM, arguments: contact).then(refreshList);

  }

  //excluir

  remove(int id){
    _service.remove(id);
    refreshList();

  }

 
 
 }

