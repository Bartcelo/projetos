import 'package:flutter/cupertino.dart';
import 'package:mobx/mobx.dart';
import 'package:teste/app/domin/entities/contact.dart';
part 'contact_form_back.g.dart';

class ContactFormBack  = _ContactFormBack with _$ContactFormBack;



abstract class _ContactFormBack with Store{
  Contact? contact;

_ContactFormBack(BuildContext context){
  var parameter = ModalRoute.of(context)?.settings.arguments;
  contact = (parameter == null) ? Contact() : parameter;
  

}
  
}