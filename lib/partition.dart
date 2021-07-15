
import 'package:cooler/adminPageFirst.dart';
import 'package:cooler/calc.dart';
import 'package:flutter/material.dart';

class ConNew extends StatelessWidget {

  var thisNomerCona = nomerYa ;
// класса нет
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200.0,
      height: 45.0,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          gradient: LinearGradient(colors: [
            Colors.deepPurpleAccent,
            Colors.indigo
          ]
          )
      ),
      //alignment: Alignment.center,
      child:
      Row(

        children: [

          Text(

            "con$thisNomerCona",
            style: TextStyle(
              color: Colors.white,
              fontSize: 25,
              fontWeight: FontWeight.w500,
              letterSpacing: 1,
            ),
          ),

          Container(
            width: 220.0,
            height: 45.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                gradient: LinearGradient(colors: [
                  Colors.cyanAccent,
                  Colors.indigo
                ]
                )
            ),
            alignment: Alignment.bottomCenter,
            child: TextField(
              decoration: InputDecoration(
                hintText: "Название",
              ),
              onSubmitted: (text) {
                // print(text);
              //  PassProverca.b = text;
                // print(PassProverca.b );
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
                Icons.delete
              ),
              onPressed:(){

              //  newPageString.removeAt(nomerYa);
                newPageString.removeAt(thisNomerCona);
                nomerYa--;
               // nomerCon--;
                print("delete  ");
                runApp(HomePg());

               // AdmPageQState().del();
              }
          )
        ],
        crossAxisAlignment: CrossAxisAlignment.center,

      )

    );
  }
}