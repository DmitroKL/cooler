import 'package:flutter/material.dart';
import 'adminPagePass.dart';
import 'calc.dart';

class FirstPage extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
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
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [

                  Container(
                    width: 220.0,  // too see ~~~
                    height: 45.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(colors: [
                          Colors.deepPurpleAccent,
                          Colors.indigo
                        ]
                        )
                    ),
                    alignment: Alignment.center,
                    child: TextButton(
                      onPressed: () {  // нажали на кнопку оператора
                        showDialog(
                          context: context,
                          builder: (context){
                            return Dialog(
                              child: Container(
                              height: 200,
                              width: 300,

                                child: Column(
                                  children: [
                                    Text(
                                        'Нажми на 2 кнопкI'
                                    ),
                                    ButtonBar(
                                      children: [
                                       TextButton(
                                         onPressed: (){
                                           print('knopka v vkladke');
                                         },
                                         child: Text(
                                           'Просто кнопка',
                                           style: TextStyle(
                                           color: Colors.red,
                                           fontSize: 25,
                                         //  fontWeight: FontWeight.w500,
                                         //  letterSpacing: 1,
                                         ),
                                         ),
                                       ),
                                        RaisedButton(
                                            onPressed: (){
                                        },
                                        child: Text(
                                          'chtoto'
                                        ),
                                        ),
                                      ],
                                    )
                                  ],
                                )
                              ),
                            );
                          }
                        );
                        print("button pressed от оператора");
                      },
                      child: Text(
                        "Оператор",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: 220.0,
                    height: 45.0,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        gradient: LinearGradient(colors: [
                          Colors.deepPurpleAccent,
                          Colors.indigo
                        ]
                        )
                    ),
                    alignment: Alignment.bottomCenter,
                    child: TextButton(
                      onPressed: () {
                        PassProverca.b = null;
                     //   print(" by admin pressed");
                        writeMemoryFirstifNULL(); // для SharedPref перед заходом на след стр
                        runApp(PassByAdmin());
                      },
                      child: Text(
                        "Администратор",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 25,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 1,
                        ),
                      ),
                    ),
                  ),
                ]
            ),
          ),
        ],
      ),
    );

  }
  
}