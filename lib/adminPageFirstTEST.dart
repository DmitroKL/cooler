import 'package:flutter/material.dart';

import 'dart:math' as math;

import 'db.dart';
import 'modelToSave.dart';

//void main() => runApp(MaterialApp(home: MyApp()));

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // data for testing
  List<ContainerCooler> testCon = [
    ContainerCooler(conNomer: '23', nameCon: "Reinter", nomerYaCon: 1),
    ContainerCooler(conNomer: '250', nameCon: "Samsung", nomerYaCon: 1),

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Flutter SQLite")),
      body: FutureBuilder<List<ContainerCooler>>(
        future: DBProvider.db.getAllContainerCoolersss(),
        builder: (BuildContext context, AsyncSnapshot<List<ContainerCooler>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (BuildContext context, int index) {
                ContainerCooler item = snapshot.data[index];
                return Dismissible(
                  key: UniqueKey(),
                  background: Container(color: Colors.red),
                  onDismissed: (direction) {
                    DBProvider.db.deleteContainerCooler(item.id);
                  },
                  child: ListTile(
                    title: Text(item.conNomer.toString()),
                    subtitle: Text(item.nameCon),
                    leading: Text(item.id.toString()),
                    trailing: IconButton(
                        icon:Icon(
                            Icons.assignment
                        ),
                        onPressed:(){
                          print("you do something");

                        }
                    )
                  ),
                );
              },
            );
          } else {
            return Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () async {
          ContainerCooler rnd = testCon[math.Random().nextInt(testCon.length)];
          await DBProvider.db.newContainerCooler(rnd);
          setState(() {});
        },
      ),
    );
  }
}
