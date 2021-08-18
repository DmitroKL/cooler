import 'package:cooler/calc.dart';
import 'package:cooler/montagList.dart';
import 'package:cooler/titlepage.dart';
import 'package:flutter/material.dart';

import 'ChangeList.dart';
import 'db.dart';
import 'modelToSave.dart';
import 'dart:math' as math;

class HomePgNEW extends StatefulWidget{

  @override
  AdmPageQState createState()=>AdmPageQState();
}

class AdmPageQState extends State<HomePgNEW>{
  List<ContainerCooler> testCon = [
    ContainerCooler(conNomer: '23', nameCon: "Reinter", nomerYaCon: 1),
    ContainerCooler(conNomer: '250', nameCon: "Samsung", nomerYaCon: 1),
  ];



  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Cooler',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: Text("Кондиционеры"),
            centerTitle: true,
            actions: [
              IconButton(
                  icon: Icon(Icons.list),
                  tooltip: 'Переход на общую базу монтажных работ',
                  onPressed:(){
                    runApp(Montag());//open new list
                  })
            ],
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
              ),
              onPressed: (){
                runApp(TitlePage());
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
                  
                   child: FutureBuilder<List<ContainerCooler>>(
                        future: DBProvider.db.getAllContainerCoolersss(),
                        builder: (BuildContext context, AsyncSnapshot<List<ContainerCooler>> snapshot) {
                        if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            //separatorBuilder:(_,__)=> Text(
                            //   "------------uh---"
                           // ),
                            itemBuilder: (BuildContext context, int index) {
                            ContainerCooler item = snapshot.data[index];
                            return Dismissible(
                                 key: UniqueKey(),
                                  background: Container(color: Colors.red),
                                   onDismissed: (direction) {
                                  DBProvider.db.deleteContainerCooler(item.id);
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
                                      item.conNomer, // item.conNomer.toString(), был инт
                                    style: TextStyle(
                                      color: Colors.blue[900],
                                      fontSize: 26,
                                      fontWeight: FontWeight.w500,
                                      letterSpacing: 1,
                                    ),
                                  ),
                                      subtitle: Text(
                                      item.nameCon,
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
                                                    Icons.arrow_forward,
                                                 //   size: 20,
                                                  ),
                                                  onPressed: (){
                                                    print("knopka");
                                                    fromname= item.nameCon;
                                                    frommodel=item.conNomer;
                                                  //  FromModeltoMontag.fr=item.conNomer ;
                                                    runApp(ChangeListMontag());
                                                  }
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
                                                              Text('Марка',
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
                                                                        hintText: item.nameCon,
                                                                        ),
                                                                    onSubmitted: (text)  {
                                                                         marka = text;
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
                                                                       DBProvider.db.idInBase =  item.id;
                                                                       DBProvider.db.conNomerInBase = item.conNomer;
                                                                       await DBProvider.db.getMarka(DBProvider.db.newMarka);
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
                                                             Text('Модель',
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
                                                                         hintText: item.conNomer,
                                                                       ),
                                                                       onSubmitted: (text) {
                                                                         model = text;
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
                                                                         DBProvider.db.idInBase =  item.id;
                                                                         DBProvider.db.nameConInBase = item.nameCon;
                                                                         await DBProvider.db.getModel(DBProvider.db.newModel);
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
              ContainerCooler random = testCon[math.Random().nextInt(testCon.length)];
              await DBProvider.db.newContainerCooler(random);
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
