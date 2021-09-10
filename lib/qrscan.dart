import 'package:flutter/material.dart';
import 'package:barcode_scan/platform_wrapper.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'dart:core';
import 'package:mess/csvOperations.dart';

class qrscan extends StatefulWidget {
  final String? pass;
  qrscan({this.pass});
  @override
  _qrscanState createState() => _qrscanState();
}

class _qrscanState extends State<qrscan> {
  String result ="Waiting...";
  String? messcheck;
  Future _scanqr() async {
    try {
      ScanResult  qrResult = await BarcodeScanner.scan() ;
      setState(() {
        result = qrResult.rawContent  ;
        if(result==messcheck) // compare the mess in the database to the scanned mess here
        {
          Navigator.pushNamed(context, '/payment');
          result = "Waiting....";
        }
        else
          result="You do not belong to this mess";
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "camera permission is denied";
        });
      }
      else {
        setState(() {
          result = 'unknown error $ex';
        });
      }
    }on FormatException  {
      setState(() {
        result ="you pressed back ";
      });
    }
  }
  @override
  Widget build(BuildContext context) {
    String? srn=widget.pass; //users srn is stored here , use it to search the db and get mess alloted
    messcheck=getMess(srn); //store the alloted mess in this variable
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: Text(
          'QR Scanner',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Center(
        child: Text(
          result,
          style: TextStyle(
            fontSize: 25.0,
            color: Colors.pink,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:(){
          _scanqr();
        },
        icon:Icon(Icons.camera_alt_rounded),
        label: Text('Scan Now'),
        backgroundColor: Colors.amberAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
