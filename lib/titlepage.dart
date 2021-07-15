import 'package:cooler/firstpage.dart';
import 'package:flutter/material.dart';

class TitlePage extends StatelessWidget{

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
        title: 'Cooler',
        home: Scaffold(
          appBar: AppBar(
            // toolbarHeight: 25.0, ВЫСОТА ПОЛКИ
            title: Text("0 page ЧП бла-бла-бла"),
            centerTitle: true,
            backgroundColor: Colors.indigo,
          ),

          body: FirstPage(),
        )
    );
  }
}