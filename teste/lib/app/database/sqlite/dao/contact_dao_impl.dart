import 'package:sqflite/sqflite.dart';
import 'package:teste/app/database/sqlite/connection.dart';
import 'package:teste/app/domin/entities/contact.dart';
import 'package:teste/app/domin/interfaces/contact_dao.dart';

class ContactDaoImpl implements ContactDAO {
  Database? _db;

  @override
  Future<List<Contact>> find() async {
    _db = await Connection.get();
    List<Map<String, dynamic>> resultado = await _db!.query('contact');
    //return resultado.map((e) => Contact.fromMap(e)) as List<Contact>;

    List<Contact> lista = List.generate(resultado.length, (i) {
      var linha = resultado[i];
      return Contact(
          id: linha['id'] ?? 0,
          nome: linha['nome'],
          telefone: linha['telefone'],
          informa: linha['informa'],
          data: linha['data']);
    });
    return lista;
  }

  @override
  remove(int id) async {
    _db = await Connection.get();
    var sql = 'DELETE FROM cotact WHERE id = ?';
    _db?.rawDelete(sql, [id]);
  }

  @override
  save(Contact contact) async {
    _db = await Connection.get();
    String sql;

    // ignore: unnecessary_null_comparison
    if (contact.id == null) {
      sql = 'INSERT INTO contact(nome,telefone,informa,data) VALUES (?,?,?,?)';
      _db?.rawInsert(
          sql, [contact.nome, contact.telefone, contact.informa, contact.data]);
    } else {
      sql =
          'UPDATE contact SET nome = ?, telefone = ?, informa = ?, data = ?, WHERE id = ?';
      _db?.rawUpdate(sql, [
        contact.nome,
        contact.telefone,
        contact.informa,
        contact.data,
        contact.id
      ]);
    }
  }
}
