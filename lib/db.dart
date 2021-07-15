import 'dart:async';
import 'dart:io';

import 'package:cooler/calc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'modelToSave.dart';

class DBProvider {
  DBProvider._();

  int idInBase;
  String conNomerInBase;
  String nameConInBase;


  static final DBProvider db = DBProvider._();

  Database _database;

  var newMarka = ContainerCooler(
    // id: 222,
    // conNomer: conNomerInBase,
    //  nameCon: marka,
      nomerYaCon: 1
  );

  var newModel = ContainerCooler(
    // id: 222,
    // conNomer: conNomerInBase,
    //  nameCon: marka,
      nomerYaCon: 1
  );

  Future<Database> get database async {
    if (_database != null) return _database;
    _database = await initDB();
    return _database;
  }

  initDB() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, "TestDB.db");
    return await openDatabase(
        path,
        version: 1,
        onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute("CREATE TABLE ContainerCooler ("
              "id INTEGER PRIMARY KEY,"
              "conNomer TEXT,"
              "nameCon TEXT,"
              "nomerYaCon INTEGER"
              ")"
          );
        });
  }

  newContainerCooler(ContainerCooler newContainerCooler) async {
    final db = await database;
    //get the biggest id in the table
    var table = await db.rawQuery(
        "SELECT MAX(id)+1 as id FROM ContainerCooler");
    int id = table.first["id"];
    //insert to the table using the new id
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

  getConNEW(ContainerCooler newContainerCooler) async {
    final db = await database;
    int id = idInBase;
    String conNomer = conNomerInBase;
    db.delete("ContainerCooler", where: "id = ?", whereArgs: [idInBase]);
    var res = await db.rawInsert(
        "INSERT Into ContainerCooler (id,conNomer,nameCon,nomerYaCon)"
            " VALUES (?,?,?,?)",
        [
          id,
          conNomer,
          marka,
          // newContainerCooler.nameCon,
          newContainerCooler.nomerYaCon
        ]);
    return res;
  }

  getModel(ContainerCooler newContainerCooler) async {
    final db = await database;
    int id = idInBase;
    String nameCon = nameConInBase;
    //int conNomer =conNomerInBase;
    db.delete("ContainerCooler", where: "id = ?", whereArgs: [idInBase]);
    var res = await db.rawInsert(
        "INSERT Into ContainerCooler (id,conNomer,nameCon,nomerYaCon)"
            " VALUES (?,?,?,?)",
        [
          id,
          model,
          nameCon,
          // newContainerCooler.nameCon,
          newContainerCooler.nomerYaCon
        ]);
    return res;
  }


/*
  newMarka(ContainerCooler newContainerCooler) async {
    final db = await database;
    int id = idInBase;

        var res = await db.query("ContainerCooler", where: "id = ?", whereArgs: [id]);
      return res.isNotEmpty ? ContainerCooler.fromMap(res.first) : null;
     // print(res);




    var raw = await db.rawInsert(
        "INSERT Into ContainerCooler (id,conNomer,nameCon,nomerYaCon)"
            " VALUES (?,?,?,?)",
        [id, newContainerCooler.conNomer, newContainerCooler.nameCon, newContainerCooler.nomerYaCon]);
    return raw;
  }


 */

  Future<List<ContainerCooler>> getAllContainerCoolersss() async {
    final db = await database;
    var res = await db.query("ContainerCooler");
    List<ContainerCooler> list =
    res.isNotEmpty ? res.map((c) => ContainerCooler.fromMap(c)).toList() : [];
    return list;
  }

  deleteContainerCooler(int id) async {
    final db = await database;
    return db.delete("ContainerCooler", where: "id = ?", whereArgs: [id]);
  }

   getAlltoSAVE( ) async {
    final db = await database;
    var res = await db.rawQuery('list');
    List<ContainerCooler> listtoSAVE =
    res.isNotEmpty ? res.map((c) => ContainerCooler.fromMap(c)).toList() : [];
    return listtoSAVE;

  }
/*
  Future<List<ContainerCooler>> getAllProducts() async {
    final db = await database;
    List<Map>
    results = await db.query(
        "ContainerCooler", columns: ContainerCooler.columns, orderBy: "id ASC");//"Product", columns: ContainerCooler.columns, orderBy: "id ASC");

    List<ContainerCooler> products = new List();
    results.forEach((result) {
      ContainerCooler product = ContainerCooler.fromMap(result);
      products.add(product);
    });
    return products;
  }


 */
}


/*
  updateCon(ContainerCooler newrew) async {   // обновления всего списка тот что вы водитса типа ранап?
    final db = await database;
    var res = await db.update("ContainerCooler", newrew.toMap(),
        where: "id = ?", whereArgs: [newrew.id]);
    return res;
  }
 */

  /*
  getCont(int id) async {
    final db = await database;
    var res = await db.query("ContainerCooler", where: "id = ?", whereArgs: [id]);
    return res.isNotEmpty ? ContainerCooler.fromMap(res.first) : null;
  }


   */




// this is not for me =>
  /*
  blockOrUnblock(Client client) async {
    final db = await database;
    Client blocked = Client(
        id: client.id,
        firstName: client.firstName,
        lastName: client.lastName,
        blocked: !client.blocked);
    var res = await db.update("Client", blocked.toMap(),
        where: "id = ?", whereArgs: [client.id]);
    return res;
  }
//  <=

   */


/*
  Future<List<Client>> getBlockedClients() async {
    final db = await database;

    print("works");
    // var res = await db.rawQuery("SELECT * FROM Client WHERE blocked=1");
    var res = await db.query("Client", where: "blocked = ? ", whereArgs: [1]);

    List<Client> list =
    res.isNotEmpty ? res.map((c) => Client.fromMap(c)).toList() : [];
    return list;
  }


 */
/*
  deleteAll() async {
    final db = await database;
    db.rawDelete("Delete * from Client");
  }


 */
