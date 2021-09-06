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

  var newOperCon = ContainerCooler( );

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
          1,  //nomerYaCon, если не поставить бесконечная загрузка :)
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
}

