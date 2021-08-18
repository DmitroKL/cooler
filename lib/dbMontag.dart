import 'dart:async';
import 'dart:io';

import 'package:cooler/calc.dart';
import 'package:cooler/modelMontagToSave.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';


class DBMontag {
  DBMontag._();

  List<ContainerMontag> hernya = [
    ContainerMontag(nazvanRab: 'Установка', stoimost: "1000", nomerYaCon: "1"),

  ];
  // this for key from Montag
  int idInBase;
  String nazvanRabInBase;
  String stoimostInBase;

  static final DBMontag db = DBMontag._();
  Database _database;

  var newRab = ContainerMontag(
    // id: 222,
    // conNomer: conNomerInBase,
    //  nameCon: marka,
      nomerYaCon: "1"
  );

  var newStoimost = ContainerMontag(
    // id: 222,
    // conNomer: conNomerInBase,
    //  nameCon: marka,
      nomerYaCon: "1"
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
          newContainerMontag.nazvanRab,
          newContainerMontag.stoimost,
          newContainerMontag.nomerYaCon
        ]);
    return raw;
  }
/*
  Future<List<ContainerMontag>> getNewChange() async {
    final db = await database;
    var id=1;
    List<ContainerMontag> tes;
    var terety= await db.query("ContainerMontag", where: "id = ?", whereArgs: [id]);
  //  List<Map<String,dynamic>> tes = cA ;


    var rewes = await db.rawInsert(

        "INSERT Into ContainerMontag (id,nazvanRab,stoimost,nomerYaCon)"
            " VALUES ("
              "${tes.id},"
              "${tes.nazvanRab},"
              "${tes.stoimost},"
            "${tes.nomerYaCon})"
    );
    print(rewes);

    var res = await db.query("ContainerMontag");
    List<ContainerMontag> list =
    res.isNotEmpty ? res.map((c) => ContainerMontag.fromMap(c)).toList() : [];
    return list;
  }


 */

/*
  getCard(int id) async {
    final db = await database;
    var ContainerMontag = await db.query("ContainerMontag", where: "id = ?", whereArgs: [id]);
   //print(await res);
  //  var name=[];
   // name.addAll(ContainerMontag);
    //return print(name);
    return ContainerMontag;
    //выводит лист, надо это запихать в список листов памяти
   //  res.isNotEmpty ? ContainerMontag.fromMap(res.first) : null;
  //   var rest = res.map((_)=> ContainerMontag()).toList();


   // hernya.addAll(rest);
   // return print(hernya.last);

   // print(await rest);
/*
    hernya.addAll(rest);

    var table = await db.rawQuery(
        "SELECT MAX(id)+1 as id FROM ContainerMontag");
    int ida = table.first["id"];
    var raw = await db.rawInsert(
        "INSERT Into ContainerMontag (id,nazvanRab,stoimost,nomerYaCon)"
            " VALUES (?,?,?,?)",
        [
          ida,
          ContainerMontag.nazvanRab,
          ContainerMontag.stoimost,
          ContainerMontag.nomerYaCon
        ]);
    return raw;
 */

  }
*/


/*
  newClient(ContainerMontag id) async {
    final db = await database;
    var rs = await db.insert("Client", id.toMap());
    return rs;
  }
*/
  getAllClients() async {
    final db = await database;
    var res = await db.query("ContainerMontag");
    List<ContainerMontag> list =
    res.isNotEmpty ? res.map((c) => ContainerMontag.fromMap(c)).toList() : [];
    return list;
  }


  Future<List<ContainerMontag>> getAllMontagCoolers() async {
    final db = await database;
    var res = await db.query("ContainerMontag");
    List<ContainerMontag> list =
    res.isNotEmpty ? res.map((c) => ContainerMontag.fromMap(c)).toList() : [];
    return list;
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



  deleteContainerMontag(int id) async {
    final db = await database;
    return db.delete("ContainerMontag", where: "id = ?", whereArgs: [id]);
  }


}