import 'dart:async';
import 'dart:io';

import 'package:cooler/calc.dart';
import 'package:cooler/modelMontagToSave.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'modelToSave.dart';

class DBMontag {
  DBMontag._();

  // this for key
  int idInBase;
  String nazvanRabInBase;
  String stoimostInBase;

  static final DBMontag db = DBMontag._();
  Database _database;

  var newRab = ContainerMontag(
    // id: 222,
    // conNomer: conNomerInBase,
    //  nameCon: marka,
      nomerYaCon: 1
  );

  var newStoimost = ContainerMontag(
    // id: 222,
    // conNomer: conNomerInBase,
    //  nameCon: marka,
      nomerYaCon: 1
  );

  Future<Database> get database async {
    if (_database != null)
      return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "MontagDB.db");
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
                  "nomerYaCon INTEGER"
                  ")"
          );
        });
  }

  newMontagCooler(ContainerMontag newContainerMontag) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery(
        "SELECT MAX(id)+1 as id FROM ContainerMontag");
    int id = table.first["id"];
    //insert to the table using the new id
    var raw = await db.rawInsert(
        "INSERT Into ContainerMontag (id,nazvanRab,stoimost,nomerYaCon)"
            " VALUES (?,?,?,?)",
        [
          id,
          newContainerMontag.nazvanRab,
          newContainerMontag.stoimost,
          newContainerMontag.nomerYaCon
        ]);
    return raw;
  }

  getnazvanRab(ContainerMontag newContainerMontag) async {
    final db = await database;
    int id = idInBase;
    String stoimost = stoimostInBase;
    db.delete("ContainerMontag", where: "id = ?", whereArgs: [idInBase]);
    var res = await db.rawInsert(
        "INSERT Into ContainerMontag (id,nazvanRab,stoimost,nomerYaCon)"
            " VALUES (?,?,?,?)",
        [
          id,
          nazvanRabCalc,
          stoimost,
          // newContainerCooler.nameCon,
          newContainerMontag.nomerYaCon
        ]);
    return res;
  }

  getstoimost(ContainerMontag newContainerMontag) async {                          //getMarka
    final db = await database;
    int id = idInBase;
    String nazvanRab = nazvanRabInBase;
    db.delete("ContainerMontag", where: "id = ?", whereArgs: [idInBase]);
    var res = await db.rawInsert(
        "INSERT Into ContainerMontag (id,nazvanRab,stoimost,nomerYaCon)"
            " VALUES (?,?,?,?)",
        [
          id,
          nazvanRab,
          stoimostCalc,
          // newContainerCooler.nameCon,
          newContainerMontag.nomerYaCon
        ]);
    return res;
  }

  Future<List<ContainerMontag>> getAllMontagCoolers() async {
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

  getAlltoSAVE( ) async {
    final db = await database;
    var res = await db.rawQuery('list');
    List<ContainerMontag> listtoSAVE =
    res.isNotEmpty ? res.map((c) => ContainerMontag.fromMap(c)).toList() : [];
    return listtoSAVE;

  }

}
