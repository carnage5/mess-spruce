import 'dart:ui';

import 'package:flutter/material.dart';

class payment extends StatefulWidget {
  const payment({Key? key}) : super(key: key);

  @override
  _paymentState createState() => _paymentState();
}

class _paymentState extends State<payment> {
  TextEditingController payment = new TextEditingController();
  int money=4500;
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    payment.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: Text(
          'Payment',
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body:Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Balance: $money',
            style: TextStyle(
              fontSize: 25.0,
              color: Colors.pink,
            ),
            ),
              SizedBox(
                height: 50.0,
              ),
             TextField(
               controller:payment,
               keyboardType: TextInputType.number,
               decoration: InputDecoration(
                 border: UnderlineInputBorder(),
                 hintText: 'Enter in rupees',
               ),
             ),
            SizedBox(
              height: 50.0,

            ),
            ButtonTheme(
              height: 50.0,
              minWidth: 100.0,
              child: FlatButton(
                onPressed: (){
                  showAlertDialog(context,int.parse(payment.text));
                  Future.delayed(Duration(seconds:3),()
                   {setState(() {
                      money=money-int.parse(payment.text);
                    });});

                },
                child: Text('pay'),
                color: Colors.red[900],),
            )
          ],
        ),
      )
    );
  }
}

showAlertDialog(BuildContext context,int pay) {
  // Create button
  int x=0;
  Widget confirmButton = FlatButton(
    child: Text("Confirm"),
    onPressed: () {
      Navigator.of(context).pop();
    },
  );
  Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed: () {
      Navigator.of(context).pop();
      
    },
  );

  // Create AlertDialog
  AlertDialog alert = AlertDialog(
    title: Text("Alert"),
    content: Text("Pay Rs $pay ?"),
    actions: [
      confirmButton,
      cancelButton,
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