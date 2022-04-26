import 'dart:async';
import 'dart:io';
import 'package:cadastro_clientes_carlos/models/contato.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  String contatotable = 'contatoa';
  String contnome = 'nome';
  String contid = 'id';
  String contempresa = 'empresa';
  String contemail = 'email';
  String continstagram = 'instagram';
  String conttelefone = 'telefone';
  String contendereco = 'endereco';
  String contnumerocasa = 'numerocasa';
  String contcep = 'cep';
  String contimg = 'img';

  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  DatabaseHelper._createInstance();

  factory DatabaseHelper() {
    _databaseHelper ??= DatabaseHelper._createInstance();
    return _databaseHelper!;
  }

  Future<Database?> get database async {
    _database ??= await initializeDatabase();
    return _database;
  }

  Future<Database> initializeDatabase() async {
    Directory diretorio = await getApplicationDocumentsDirectory();
    String path = '${diretorio.path}contatoa.db';
    var contatosDatabase =
        await openDatabase(path, version: 1, onCreate: _creatDb);
    return contatosDatabase;
  }

  void _creatDb(Database db, int newVersion) async {
    await db.execute(
        'CREATE TABLE $contatotable($contid INTEGER PRIMARY KEY AUTOINCREMENT, $contnome TERXT, $contempresa TEXT, $contemail TEXT, $continstagram TEXT, $conttelefone INTEGER, $contendereco TEXT, $contnumerocasa INTEGER, $contcep INTEGER, $contimg TEXT )');
  }

  Future<int?> insertContato(Contato contato) async {
    Database? db = await database;
    var resultado = await db!.insert(contatotable, contato.toMap());

    return resultado;
  }

  Future<Contato?> getContato(int id) async {
    Database? db = await database;
    List<Map> maps = await db!.query(contatotable,
        columns: [
          contid,
          contnome,
          contempresa,
          contemail,
          continstagram,
          conttelefone,
          contendereco,
          contnumerocasa,
          contcep,
          contimg
        ],
        where: "$contid = ?",
        whereArgs: [contid]);

    if (maps.isNotEmpty) {
      return Contato.fromMap(<String, dynamic>{});
    } else {
      return null;
    }
  }

  Future<int?> atualizaContato(Contato contato) async {
    Database? db = await database;
    var resultado = await db!.update(
      contatotable,
      contato.toMap(),
      where: '$contid = ?',
      whereArgs: [contato.id],
    );

    return resultado;
  }

  Future<int?> deletaContato(int id) async {
    Database? db = await database;

    int resultado = await db!.delete(
      contatotable,
      where: '$contid = ?',
      whereArgs: [id],
    );

    return resultado;
  }

  Future<int> getconte() async {
    Database? db = await database;

    List<Map<String, dynamic>> x =
        await db!.rawQuery('SELECT COUNT(*) from $contatotable');

    int? resultado = Sqflite.firstIntValue(x);

    return resultado!;
  }

  Future<List<Contato>> getContatos(List<Contato> lista) async {
    Database? db = await database;

    var resultado = await db!.query(contatotable);

    List<Contato> lista = resultado.isNotEmpty
        ? resultado.map((c) => Contato.fromMap(c)).toList()
        : [];

    return lista;
  }

  Future closeDb() async {
    Database? db = await database;
    db!.close();
  }
}
