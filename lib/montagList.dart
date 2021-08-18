import 'package:cooler/calc.dart';

import 'package:flutter/material.dart';
import 'admPageFirstNEW.dart';
import 'dbChange.dart';
import 'dbMontag.dart';
import 'modelMontagToSave.dart';

import 'dart:math' as math;

class Montag extends StatefulWidget{

  @override
  AdmPageQState createState()=>AdmPageQState();
}

class AdmPageQState extends State<Montag>{

  List<ContainerMontag> tes = [
    ContainerMontag(nazvanRab: 'dfdh', stoimost: "4567", nomerYaCon: "1")
  ];

  List<ContainerMontag> testMontCon = [
    ContainerMontag(nazvanRab: 'Установка', stoimost: "1000", nomerYaCon: "1"),
    ContainerMontag(nazvanRab: 'Ремонт', stoimost: "3400", nomerYaCon: "1"),
  ];




  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Cooler',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: Text("МОНТАЖ - ОБЩАЯ БАЗА"),
            centerTitle: true,
            /*
            actions: [
              IconButton(icon: Icon(Icons.list),
                  onPressed:(){
                    //open new list
                  })
            ],
             */
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
              ),
              onPressed: (){
                runApp(HomePgNEW());
                print("knopka");
              },
            ),
          ),

          body: Container(
            child: Stack(
              children: [

                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/ad.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                  padding: EdgeInsets.all(double.infinity),
                ),

                Center(

                  child: FutureBuilder<List<ContainerMontag>>(
                    future: DBMontag.db.getAllMontagCoolers(),
                    builder: (BuildContext context, AsyncSnapshot<List<ContainerMontag>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(

                            itemCount: snapshot.data.length,
                            //separatorBuilder:(_,__)=> Text(
                            //   "------------uh---"
                            // ),
                            itemBuilder: (BuildContext context, int index) {
                              ContainerMontag item = snapshot.data[index];
                             // if (item.stoimost =="1000");
                              return Dismissible(
                                key: UniqueKey(),
                                background: Container(color: Colors.red),
                                onDismissed: (direction) {
                                  DBMontag.db.deleteContainerMontag(item.id);
                                  setState(() {});
                                },
                                child: Column(
                                    children:[
                                      Container(
                                        //width: 500.0,
                                          height: 10.0
                                      ),
                                      Container(
                                        width: 500.0,
                                        height: 70.0,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(20.0),
                                            gradient: LinearGradient(colors: [
                                              Colors.cyan[200],
                                              Colors.cyan[50]
                                            ]
                                            )
                                        ),
                                        alignment: Alignment.bottomCenter,
                                        child:ListTile(
                                            title: Text(
                                              item.nazvanRab,
                                                // if item.stoimost =="1000",// item.conNomer.toString(), был инт
                                              style: TextStyle(
                                                color: Colors.blue[900],
                                                fontSize: 26,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                            subtitle: Text(
                                              item.stoimost,
                                              style: TextStyle(
                                                color: Colors.blue[900],
                                                fontSize: 15,
                                                fontWeight: FontWeight.w500,
                                                letterSpacing: 1,
                                              ),
                                            ),
                                            leading: Text(item.id.toString()),
                                            trailing:
                                            Row(
                                              mainAxisSize: MainAxisSize.min,
                                              children: [

                                                IconButton(
                                                    icon: Icon(
                                                      Icons.add_circle,
                                                      //   size: 20,
                                                    ),
                                                    onPressed: ()
                                                  //    print("knopka");

                                                      async{
                                               // DBChange.db.idInBase =  item.id;
                                                DBChange.db.nazvanRabNEW = item.nazvanRab;
                                                DBChange.db.stoimostNEW = item.stoimost;
                                                DBChange.db.nomerYaConNEW =connamedvepaytNol ;
                                                await DBChange.db.newMontagCooler(DBChange.db.newChangeCon);
                                                        setState(() {});

                                                    },
                                                ),

                                                IconButton(
                                                    icon:Icon(
                                                        Icons.assignment
                                                    ),
                                                    onPressed:(){   //DIALOG !!!!!!!! TYT
                                                      showDialog(
                                                          context: context,
                                                          builder: (context){
                                                            return Dialog(
                                                              child: Container(
                                                                // alignment: Alignment.center ,
                                                                height: 260,
                                                                width: 300,
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                  children: [
                                                                    Text('Редактор',
                                                                        style:TextStyle(
                                                                          fontSize: 25,
                                                                          fontWeight: FontWeight.w500,
                                                                          letterSpacing: 1,
                                                                        )
                                                                    ),
                                                                    Container(
                                                                      height: 80,
                                                                      width: 250,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                          gradient: LinearGradient(colors: [
                                                                            Colors.cyan[50],
                                                                            Colors.cyan[100]
                                                                          ]
                                                                          )
                                                                      ),
                                                                      child:Column(
                                                                        children: [
                                                                          Text('Стоимость',
                                                                              style:TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.w500,
                                                                                letterSpacing: 0.5,
                                                                              )
                                                                          ),
                                                                          Row(
                                                                              children: [
                                                                                Container(
                                                                                  height: 40,
                                                                                  width: 165,
                                                                                  margin: EdgeInsets.all(10.10),
                                                                                  child:TextField(
                                                                                    decoration: InputDecoration(
                                                                                      hintText: item.stoimost,
                                                                                    ),
                                                                                    onSubmitted: (text)  {
                                                                                      stoimostCalc = text;
                                                                                    },
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(
                                                                                      fontSize: 25,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      letterSpacing: 1,
                                                                                    ),
                                                                                  ),
                                                                                ),

                                                                                IconButton(
                                                                                    icon:Icon(
                                                                                      Icons.add_circle,
                                                                                      size: 35.0,
                                                                                      color: Colors.red,
                                                                                    ),
                                                                                    onPressed:() async{
                                                                                      DBMontag.db.idInBase =  item.id;
                                                                                      DBMontag.db.nazvanRabInBase = item.nazvanRab;
                                                                                      await DBMontag.db.getstoimost(DBMontag.db.newStoimost);
                                                                                      setState(() {});
                                                                                    }

                                                                                ),
                                                                              ]
                                                                          )
                                                                        ],
                                                                      ) ,
                                                                    ),
                                                                    Container(
                                                                      height: 80,
                                                                      width: 250,
                                                                      // color: Colors.cyan,
                                                                      decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(10.0),
                                                                          gradient: LinearGradient(colors: [
                                                                            Colors.cyan[50],
                                                                            Colors.cyan[100]
                                                                          ]
                                                                          )
                                                                      ),
                                                                      child:Column(
                                                                        children: [
                                                                          Text('Название работы',
                                                                              style:TextStyle(
                                                                                fontSize: 16,
                                                                                fontWeight: FontWeight.w500,
                                                                                letterSpacing: 0.5,
                                                                              )
                                                                          ),
                                                                          Row(
                                                                              children: [
                                                                                Container(
                                                                                  height: 40,
                                                                                  width: 165,
                                                                                  margin: EdgeInsets.all(10.10),
                                                                                  // alignment: Alignment.bottomCenter,
                                                                                  child:TextField(
                                                                                    decoration: InputDecoration(
                                                                                      hintText: item.nazvanRab,
                                                                                    ),
                                                                                    onSubmitted: (text) {
                                                                                      nazvanRabCalc = text;
                                                                                    },
                                                                                    textAlign: TextAlign.center,
                                                                                    style: TextStyle(
                                                                                      fontSize: 25,
                                                                                      fontWeight: FontWeight.w500,
                                                                                      letterSpacing: 1,
                                                                                    ),
                                                                                  ),
                                                                                ),

                                                                                IconButton(
                                                                                    icon:Icon(
                                                                                      Icons.add_circle,
                                                                                      size: 35.0,
                                                                                      color: Colors.red,
                                                                                    ),
                                                                                    onPressed:()async{
                                                                                      DBMontag.db.idInBase =  item.id;
                                                                                      DBMontag.db.stoimostInBase = item.stoimost;
                                                                                      await DBMontag.db.getnazvanRab(DBMontag.db.newRab);
                                                                                      setState(() {});
                                                                                    }
                                                                                ),
                                                                              ]
                                                                          )
                                                                        ],
                                                                      ) ,
                                                                    )

                                                                  ],
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                      );
                                                      print("you do something");

                                                    }
                                                )



                                              ],
                                            )


                                        ),
                                      ),
                                    ]
                                ),
                              );

                            }
                        );

                      } else {
                        return Center(child: CircularProgressIndicator());
                      }
                    },

                  ),
                )
              ],
            ),
          ),

          floatingActionButton: FloatingActionButton(
            onPressed: () async{


              ContainerMontag random = testMontCon[math.Random().nextInt(testMontCon.length)];
              await DBMontag.db.newMontagCooler(random);
              setState(() {});
            },
            child: const Icon(Icons.add,
                size: 40.0),
            backgroundColor: Colors.indigo,
          ),
        )
    );
  }
}
