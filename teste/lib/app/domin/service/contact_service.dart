import 'package:get_it/get_it.dart';
import 'package:teste/app/domin/entities/contact.dart';
import 'package:teste/app/domin/exepition/domain_layer_exption.dart';
import 'package:teste/app/domin/interfaces/contact_dao.dart';

class ContactService {
  var _dao = GetIt.I.get<ContactDAO>();

  save(Contact contact) {
    validaname(contact.nome);
    validainforma(contact.informa);
    validadata(contact.data);
    validatelefone(contact.telefone);
    _dao.save(contact);
  }

  remove(int id) {
    _dao.remove(id);
  }

  Future<List<Contact>> find() {
    return _dao.find();
  }

  validaname(String name) {
    var mim = 3;
    var max = 50;
    if (name.length < mim) {
      throw DomainLayerExption("O nome tem que ser maior que $mim caracteres.");
    } else if (name.length > max) {
      throw DomainLayerExption("O nome tem que ser menor que $max caracteres.");
    }
  }

  validainforma(String informa) {
    if (informa == null) {
      throw DomainLayerExption(
          "Deve ser colocado informações sobre o cotato feito.");
    } else if (informa.length > 500) {
      throw DomainLayerExption(
          "As informações devem conter no maximo 500 caracteres.");
    }
  }

  validatelefone(String telefone) {
    if (telefone == null) {
      throw DomainLayerExption("O telefone é obrigatório.");
    } else if (telefone.length != 9) {
      throw DomainLayerExption(
          "O numero do telefone deve possuir onve digitos.");
    }
  }

  validadata(int data) {
    if (data == null) {
      throw DomainLayerExption("A data é obrigatório.");
    } else if (data.bitLength != 6) {
      throw DomainLayerExption(
          "A data deve possuir seis digitos sendo dois para dia dois para mes e dois para ano.");
    }
  }
}
