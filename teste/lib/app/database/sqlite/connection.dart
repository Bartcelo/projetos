

// ignore_for_file: unnecessary_null_comparison

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:teste/app/database/sqlite/script.dart';

class Connection{
static  Database? _db;


static Future <Database?> get() async{
if (_db == null) {
  var path = join(await getDatabasesPath(), "banco_contato"); 
  _db = await openDatabase(
    path,
    version: 1,
    onCreate: (db,v){
      db.execute(createTable);
       db.execute(insert);
       db.execute(insert2);
       db.execute(insert3);
    } ,
    );
} 
return _db;
}
}