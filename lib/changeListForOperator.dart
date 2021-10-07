import 'package:cooler/calc.dart';

import 'package:flutter/material.dart';
import 'admPageFirstNEW.dart';
import 'dbChange.dart';
import 'modelMontagToSave.dart';
import 'operatorList.dart';


class ChangeListOperator extends StatefulWidget{
  @override
  ListChange createState()=>ListChange();
}
class ListChange extends State<ChangeListOperator>{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Cooler',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: Text("$fromname - $frommodel"),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
              ),
              onPressed: (){
                runApp(OperatorList());
                print("knopka oper");
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
                    future: DBChange.db.getForCoolerChange(),
                    builder: (BuildContext context, AsyncSnapshot<List<ContainerMontag>> snapshot) {
                      if (snapshot.hasData) {
                        return ListView.builder(
                            itemCount: snapshot.data.length,
                            itemBuilder: (BuildContext context, int index) {
                              ContainerMontag item = snapshot.data[index];
                              return Dismissible(
                                key: UniqueKey(),
                                background: Container(color: Colors.red),
                                onDismissed: (direction) {
                                  DBChange.db.deleteContainerMontag(item.id);
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
/*
          floatingActionButton: FloatingActionButton(
            onPressed: ()

            async{

              //   ContainerMontag random = testMontCon[math.Random().nextInt(testMontCon.length)];
              //  await DBChange.db.newMontagCooler(random);

              setState(() {});
            },
            child: const Icon(Icons.add,
                size: 40.0),
            backgroundColor: Colors.indigo,
          ),
          */
        )
    );
  }
}
