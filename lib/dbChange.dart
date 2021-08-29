import 'dart:async';
import 'dart:io';

import 'package:cooler/calc.dart';
import 'package:cooler/modelMontagToSave.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

// frommodel
class DBChange {
  DBChange._();

  var nazvanRabNEW ;
  var stoimostNEW ;
  var nomerYaConNEW ;



/*
  // this for key from Montag
  int idInBase;
  String nazvanRabInBase;
  String stoimostInBase;
*/
  static final DBChange db = DBChange._();
  Database _database;

  var newChangeCon = ContainerMontag(
    // id: 222,
    // conNomer: conNomerInBase,
    //  nameCon: marka,
     // nomerYaCon: "1"
  );

  Future<Database> get database async {
    if (_database != null)
      return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "Change.db");
    return await openDatabase(
        path,
        version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE ContainerMontag ("
                  "id INTEGER PRIMARY KEY,"
                  "nazvanRab TEXT,"
                  "stoimost TEXT,"
                  "nomerYaCon TEXT"
                  ")"
          );
        });
  }

   newMontagCooler(ContainerMontag newContainerMontag) async {
    final db = await database;
    var table = await db.rawQuery(
        "SELECT MAX(id)+1 as id FROM ContainerMontag");
    int id = table.first["id"];
    var raw = await db.rawInsert(
        "INSERT Into ContainerMontag (id,nazvanRab,stoimost,nomerYaCon)"
            " VALUES (?,?,?,?)",
        [
          id,
          nazvanRabNEW,
          stoimostNEW,
          nomerYaConNEW,
        ]);
    return raw;
  }

   Future<List<ContainerMontag>> getAllMontagCoolers() async {  //
     final db = await database;
    var res = await db.query("ContainerMontag");
    List<ContainerMontag> list =
    res.isNotEmpty ? res.map((c) => ContainerMontag.fromMap(c)).toList() : [];
    return list;
  }

  deleteContainerMontag(int id) async {
    final db = await database;
    return db.delete("ContainerMontag", where: "id = ?", whereArgs: [id]);
  }

  Future<List<ContainerMontag>> getForCoolerChange() async {
 // getForCoolerChange() async {  //read only change
    final db = await database;
    print("work");
    //var res = await db.rawQuery("SELECT * FROM ContainerMontag WHERE nomerYaCon=250");
    var res = await db.query("ContainerMontag", where: "nomerYaCon = ? ", whereArgs: [nomerYaConNEW]);
    List<ContainerMontag> list =
    //res.isNotEmpty ? res.toList().map((c) => ContainerMontag.fromMap(c)) : null;
    res.isNotEmpty ? res.map((c) => ContainerMontag.fromMap(c)).toList() : [];
    return list;
  }


}
