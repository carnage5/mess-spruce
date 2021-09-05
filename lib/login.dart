import 'dart:ui';

import 'package:flutter/material.dart';
class login extends StatefulWidget {
  const login({Key? key}) : super(key: key);

  @override
  _loginState createState() => _loginState();
}

class _loginState extends State<login> {
  bool lg=true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        title: Text(
            'Mess Spruce',
        style: TextStyle(
          color: Colors.black,
        ),
        ),
        centerTitle: true,
        backgroundColor: Colors.amberAccent,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: "SRN",
                hintStyle: TextStyle(
                  color: Colors.blue,
                ),
                labelText: "SRN",
                labelStyle: TextStyle(
                  fontSize: 15.0,
                  color: Colors.amberAccent,
                ),
                border: OutlineInputBorder(),
                fillColor: Colors.blueGrey,
                filled: true,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: TextField(
              decoration: InputDecoration(
                //hintText: "Password",
                hintStyle: TextStyle(
                  color: Colors.blue,
                ),
                labelText: "Password",
                labelStyle: TextStyle(
                  fontSize: 15.0,
                  color: Colors.amberAccent,
                ),
                border: OutlineInputBorder(),
                fillColor: Colors.blueGrey,
                filled: true,
                suffixIcon: IconButton(
                    onPressed: (){
                      setState(() {
                        lg=!lg;
                      });
                    },
                    icon: Icon(lg ? Icons.remove_red_eye : Icons.security),
                ),
              ),
              obscureText: lg,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 25.0,horizontal: 75.0),
            child: ButtonTheme(
              height: 50.0,
              child: FlatButton(
                  onPressed: (){
                    Navigator.pushNamed(context, '/menu');
                  },
                  child: Text('Login'),
              color: Colors.amberAccent,),
            ),
          )
        ],
      ),
    );
  }
}
