import 'package:cooler/modelToSave.dart';
import 'package:cooler/partition.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'db.dart';

var listSAVE = ContainerCooler();

 String marka='marka-null' ;

String model = 'model-null';

class PassProverca{
  static var pass = "a";
  static var b ;
}

int nomerCon = 1;
int nomerYa = 0;

 List<Widget> newPageString = [] ;

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








