import 'package:flutter/material.dart';

import 'FirstPage.dart';
import 'TabPage.dart';
import 'help.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Map<String, dynamic>>(
        future:
        Helper.initAuth(), // a previously-obtained Future<String> or null
        builder: (BuildContext context, AsyncSnapshot<Map<String, dynamic>> snapshot) {
          Map<String, dynamic> data = snapshot.data as Map<String, dynamic>;
          print(data);
          bool isLogged = data[Helper.key_isLogged] as bool;

          return isLogged
              ? TabPage (): MaterialApp(
            home: Scaffold(body:

            LoginPage(),
              backgroundColor: Colors.black,
          ) );

          // const MyHomePage(title: 'Flutter Demo Home Page'),
        });
  }
}


