import 'dart:ui';
import 'package:flutter/cupertino.dart';
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
  String result = "Waiting...";
  String? messcheck;

  Future _scanqr() async {
    try {
      ScanResult qrResult = await BarcodeScanner.scan();
      setState(() {
        result = qrResult.rawContent;
        if (result == messcheck) // compare the mess in the database to the scanned mess here
            {
          Navigator.pushNamed(context, '/payment');
          result = "Waiting...";
        }
        else
          showAlertDialog(context, result);
          result="Warning: Scan again";
      });
    } on PlatformException catch (ex) {
      if (ex.code == BarcodeScanner.cameraAccessDenied) {
        setState(() {
          result = "Alert: camera permission is denied";
        });
      }
      else {
        setState(() {
          result = 'Error: Alert: unknown error $ex';
        });
      }
    } on FormatException {
      setState(() {
        result = "Alert: you pressed back ";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    String? srn = widget.pass; //users srn is stored here , use it to search the db and get mess alloted
    messcheck = getMess(srn); //store the alloted mess in this variable
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text(
          'QR Scanner',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                "https://previews.123rf.com/images/paitoonpati/paitoonpati1709/paitoonpati170900135/86156468-seamless-pattern-background-food-and-ingredient-kids-hand-drawing-set-illustration-isolated-on-white.jpg"
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 150.0,
            ),
          Container(
            color: Colors.orange[100],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child:
              Text('You belong to  ',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.red[900],
                  )),
            ),
          ),
            Container(
              color: Colors.orange[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                Text('$messcheck ',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900],
                    )),
              ),
            ),
            Container(
              color: Colors.orange[100],
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                Text(' $result ',
                    style: TextStyle(
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.red[900],
                    )),
              ),
            ),
            SizedBox(
              height: 140.0,
            ),
            Center(

              child: FloatingActionButton.extended(
                onPressed: () {
                  _scanqr();
                },
                splashColor: Colors.red,
                icon: Icon(Icons.camera_alt_rounded,
                color: Colors.black,
                size: 30.0,),
                label: Text(
                  'Scan Now',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.0,
                  ),
                ),
                backgroundColor: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  showAlertDialog(BuildContext context, String? mess) {
    // Create button
    Widget okButton = FlatButton(
      child: Text("Try again"),
      color: Colors.orange,
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    // Create AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Warning !!"),

      content: Text("You were not allocated $mess"),
      actions: [
        okButton,
      ],
    );
    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }
}
