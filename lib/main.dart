import 'package:flutter/material.dart';
import 'package:mess/login.dart';
import 'package:mess/menu.dart';
import 'package:mess/payment.dart';
import 'package:mess/qrscan.dart';
import 'package:mess/selectmess.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/login',
    routes: {
      '/menu': (context) => menu(),
      '/selectmess': (context) =>selectmess(),
      '/qrscan' :(context) =>qrscan(),
      '/login' :(context) =>login(),
      '/payment':(context) => payment(),
      //use -> Navigator.pushNamed(context, '/routename');

    },

  ));
}

