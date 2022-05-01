
import 'dart:io';
import 'package:blockfivetransfer/help.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'TabPage.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late TextEditingController _controllerEmail;
  late TextEditingController _controllerMdp;

  @override
  void initState() {
    super.initState();
    _controllerEmail = TextEditingController();
    _controllerMdp = TextEditingController();
  }

  @override
  void dispose() {
    _controllerEmail.dispose();
    _controllerMdp.dispose();
    super.dispose();
  }

  TextStyle style = new TextStyle(color: Colors.black);




  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
      ),
      elevation: 100,
      margin: EdgeInsets.fromLTRB(12, 2, 12, 2),
      color: Color.fromARGB(237, 246, 245, 245),
      child: Center(child:

      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text("UserName", style: style,),
        TextField(
          style: style,
          obscureText: false,
          controller: _controllerEmail,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'pseudo',
          ),),
        Divider(height: 25,),
        Text("Password", style: style),
        TextField(
          style: style,
          obscureText: true,
          enableSuggestions: false,
          autocorrect: false,
          controller: _controllerMdp,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'mypassword',
          ),
        ),

          Divider(height: 30,),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
          TextButton(onPressed: () async { await Helper.saveIdentificaion(_controllerEmail.value.text, _controllerMdp.value.text);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TabPage()),
          );
          },
            child: Text('Sign In'), ),
          TextButton(onPressed: (){ Helper.checkIdentification(_controllerEmail.value.text, _controllerMdp.value.text);
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const TabPage()),
          );
          },
              child: Text('Log In')),
        ],)


      ],),
          ));
  }
}




