import 'package:cooler/partition.dart';
import 'package:cooler/titlepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'calc.dart';


class HomePg extends StatefulWidget{

  @override
  AdmPageQState createState()=>AdmPageQState();
}

class AdmPageQState extends State<HomePg>{

  dob() {
    setState(() {
      newPageString.add(ConNew());
    });
  }

/*
  preobrazovanie(){ //good
    setState(() {


      List <String> list = ['ConNew()'];

      List<Widget> newPageStringQQ=list.map((name)=> ConNew()).toList();
      ne.addAll(newPageStringQQ);
      print(newPageStringQQ);
      print(ne);
    });

  }


 */

/*
  readmemory() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('hj', newConteiner);
    var tyu = prefs.get('hj');

    List<Widget> newPageStringQQ = tyu.map((name) => Text(name)).toList();
    print(newPageStringQQ);
  }
  
 */
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Cooler',
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: Text(" 2 test"),
            centerTitle: true,
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
                  child: ListView.separated(
                    physics: BouncingScrollPhysics() ,

                    //itemCount: newPageString.length,
                    itemCount: newPageString.length,
                    itemBuilder: (_,index)=> Container(    //Container

                      child: newPageString[index],

                    ),

                    separatorBuilder:(_,__)=> Text(
                        "------------uh---"
                    ),

                  ),
                )

              ],
            ),
          ),


          floatingActionButton: FloatingActionButton(
            onPressed: (){
            //  incrementCounter();
              dob();
              saveInMemoryOll();

            //  preobrazovanie();
              nomerCon=1+nomerCon;
              nomerYa++;
              print("+ ок $nomerCon  nomerYa $nomerYa" );
            },
            child: const Icon(Icons.add,
                size: 40.0),
            backgroundColor: Colors.indigo,
          ),
        )
    );
  }
}
