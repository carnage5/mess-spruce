import 'package:flutter/material.dart';
import 'package:barcode_scan/platform_wrapper.dart';
import 'dart:async';
import 'package:barcode_scan/barcode_scan.dart';
import 'package:flutter/services.dart';
import 'package:flutter/scheduler.dart';
import 'dart:core';
class qrscan extends StatefulWidget {
  const qrscan({Key? key}) : super(key: key);

  @override
  _qrscanState createState() => _qrscanState();
}

class _qrscanState extends State<qrscan> {
  String result ="Waiting...";
  Future _scanqr() async {
    try {
      ScanResult  qrResult = await BarcodeScanner.scan() ;
      setState(() {
        result = qrResult.rawContent  ;
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
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed:(){
          _scanqr;
          //Navigator.pushNamed(context, '/payment');
        },
        icon:Icon(Icons.camera_alt_rounded),
        label: Text('Scan Now'),
        backgroundColor: Colors.amberAccent,

      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
