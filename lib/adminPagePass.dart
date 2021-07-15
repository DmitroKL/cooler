import 'package:cooler/admPageFirstNEW.dart';
import 'package:cooler/adminPageFirst.dart';
import 'package:cooler/titlepage.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'calc.dart';


class PassByAdmin extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Cooler',
        home: Scaffold(

          appBar: AppBar(
            backgroundColor: Colors.indigo,
            title: Text(" 1 adm page ЧП бла-бла-бла"),
            centerTitle: true,
            leading: IconButton(
              icon: Icon(
                Icons.arrow_back_outlined,
              ),
              onPressed: (){
                runApp(TitlePage());
              },
            ),
          ),

          body: Builder(
            builder: (context) => PassByAdminZEROq(),
          ),
        )
    );
  }
}

class PassByAdminZEROq extends StatelessWidget {

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

                mainAxisAlignment: MainAxisAlignment.center,
                children: [

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
                    alignment: Alignment.center,

                    child: Text(
                      "ПАРОЛЬ",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.w500,
                        letterSpacing: 1,
                      ),
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
                        hintText: "Введите пароль",
                      ),
                      onSubmitted: (text) {
                       // print(text);
                        PassProverca.b = text;
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

                  Container(
                    width: 220.0,
                    height: 45.0,
                  ),

                  Container(
                    width: 120.0,
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
                      onPressed: () {

                       // print("pass yes or no");
                      //  print(PassProverca.b);
                       // print(PassProverca.pass);

                        if (PassProverca.b == PassProverca.pass){
                          print("произведенна проверка она гуд");

                         // runApp(HomePg()); // СЮДА СМОТРЕТЬ!!!!!!
                          runApp(HomePgNEW());

                         // preobrazovanie();
                          //readmemory();

                        }
                        else {
                          print("pass веден не верно!!!!");
                          _showToast(context);
                        }
                      },
                      child: Text(
                        "ОK",
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

  void _showToast(BuildContext context) {
    final scaffold = Scaffold.of(context);
    scaffold.showSnackBar(
        SnackBar(
          //content: const Text('Пароль введен не верно!!!'),
          content:Column(
              mainAxisSize: MainAxisSize.min,
              children:<Widget>[
                Text('НЕ УГАДАЛ !!!',
                  textAlign: TextAlign.center, ),
                Ink.image(
                  height:180.0,
                  image:AssetImage("assets/images/no.jpg"),
                ),
              ]
          ),
          action:SnackBarAction(
              label: 'Я понял, не злись...',
              onPressed: scaffold.hideCurrentSnackBar
          ),
        )
    );
  }

}

