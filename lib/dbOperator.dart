import 'dart:async';
import 'dart:io';

import 'package:cooler/calc.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'modelToSave.dart';

class DBOperator {
  DBOperator._();

  static final DBOperator db = DBOperator._();
  Database _database;

  String operModel;
  String operMarka;
  String operCvet;
  var idInBaseOp;

  String operModelTooAdm;
  String operMarkaTooAdm;
  String operCvetTooAdm ;
  var idcvetTooAdm;

  var newOperCon = ContainerCooler();

  Future<Database> get database async {
    if (_database != null)
      return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "OperatorDB.db");
    return await openDatabase(
        path,
        version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute(
              "CREATE TABLE ContainerCooler ("
                  "id INTEGER PRIMARY KEY,"
                  "conNomer TEXT,"
                  "nameCon TEXT,"
                  "nomerYaCon INTEGER,"
                  "cvet TEXT"
                  ")"
          );
        });
  }

/*
  newContainerCooler(ContainerCooler newContainerCooler) async {
    final db = await database;
    var table = await db.rawQuery(
        "SELECT MAX(id)+1 as id FROM ContainerCooler");
    int id = table.first["id"];
    var raw = await db.rawInsert(
        "INSERT Into ContainerCooler (id,conNomer,nameCon,nomerYaCon)"
            " VALUES (?,?,?,?)",
        [
          id,
          newContainerCooler.conNomer,
          newContainerCooler.nameCon,
          newContainerCooler.nomerYaCon
        ]);
    return raw;
  }
*/

  newCoolerTooOper(ContainerCooler newContainerCooler) async {
    final db = await database;
    var table = await db.rawQuery(
        "SELECT MAX(id)+1 as id FROM ContainerCooler");
    int id = table.first["id"];
    var raw = await db.rawInsert(
        "INSERT Into ContainerCooler (id,conNomer,nameCon,nomerYaCon,cvet)"
            " VALUES (?,?,?,?,?)",
        [
          id,
          operModel,
          operMarka,
          1, //nomerYaCon, ???????? ???? ?????????????????? ?????????????????????? ???????????????? :)
          operCvet
        ]);
    return raw;
  }

  Future<List<ContainerCooler>> getAllContainer() async {
    final db = await database;
    var res = await db.query("ContainerCooler");
    List<ContainerCooler> list =
    res.isNotEmpty ? res.map((c) => ContainerCooler.fromMap(c)).toList() : [];
    return list;
  }

  getCvetOper(ContainerCooler newContainerCooler) async {
    final db = await database;
    int id = idcvetTooAdm;
    var cvetnewOper = '???';

    db.delete("ContainerCooler", where: "id = ?", whereArgs: [idcvetTooAdm]);
    var res = await db.rawInsert(
        "INSERT Into ContainerCooler (id,conNomer,nameCon,nomerYaCon,cvet)"
            " VALUES (?,?,?,?,?)",
        [
          id,
          operModelTooAdm,
          operMarkaTooAdm,
          1,
          cvetnewOper,
        ]);
    return res;
  }



  deleteContainerCooler(int id) async {
    final db = await database;
    return db.delete("ContainerCooler", where: "id = ?", whereArgs: [id]);
  }


/*
  Future<List<ContainerMontag>> getForCoolerChange() async {
    // getForCoolerChange() async {  //read only change
    final db = await database;
    print("work oper");
    //var res = await db.rawQuery("SELECT * FROM ContainerMontag WHERE nomerYaCon=250");
    var res = await db.query("ContainerMontag", where: "nomerYaCon = ? ", whereArgs: [operModelTooAdm]);
    List<ContainerMontag> list =
    //res.isNotEmpty ? res.toList().map((c) => ContainerMontag.fromMap(c)) : null;
    res.isNotEmpty ? res.map((c) => ContainerMontag.fromMap(c)).toList() : [];
    return list;
  }
*/
  /* :)
  getCvet(ContainerCooler newContainerCooler) async {
    final db = await database;
    int id = idInBaseOp;
    var cvetnewOper = '???';

    db.delete("ContainerCooler", where: "id = ?", whereArgs: [idInBaseOp]);
    var res = await db.rawInsert(
        "INSERT Into ContainerCooler (id,conNomer,nameCon,nomerYaCon,cvet)"
            " VALUES (?,?,?,?,?)",
        [
          id,
          operModel,
          operMarka,
          1,
          cvetnewOper,
        ]);
    return res;
  }
  */

}