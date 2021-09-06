import 'package:cooler/modelToSave.dart';
import 'package:cooler/partition.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'db.dart';
import 'dbChange.dart';
import 'dbChange.dart';

var connamedvepaytNol='250'; //primer

var cvetNewFor = Colors.black12;

var fromname = "null - from card coolers";   //марка
var frommodel = "null - from card coolers"; //модель

// ignore: non_constant_identifier_names
var Frut = "sdd";
/*
class FromModeltoMontag{
  var fr = "null - from card coolers";
}
 */

var listSAVE = ContainerCooler();


String cvetglavnCon  ;
//var cvetDlyaPageFirst  = Colors.black12;
var cvetDlyaPageFirst  ;

String stoimostCalc = 'stoimost-null';
String nazvanRabCalc = 'nazvanRab-null';

String marka='marka-null' ;
String model = 'model-null';
//String cvetTooDB='model - null';

class PassProverca{
  static var pass = "a";
  static var b ;
}

int nomerCon = 1;
int nomerYa = 0;

 List<Widget> newPageString = [] ; //для SharedPref

 saveInMemoryOll()async{
   SharedPreferences pr = await SharedPreferences.getInstance();
   List<String> ned=newPageString.map((name)=> 'ConNew()').toList();
   pr.setStringList('keyMemory', ned);
   print(ned);
   print(pr);
   var wer= pr.getStringList('keyMemory');
   print(wer);
 }

writeMemoryFirstifNULL() async{
  SharedPreferences pr = await SharedPreferences.getInstance();
  List <String> valuefirst=(pr.getStringList('keyMemory'))??['ConNew()'];
  print(valuefirst);
  List<Widget> newPageCon=valuefirst.map((name)=> ConNew()).toList();
  newPageString = newPageCon;
}









